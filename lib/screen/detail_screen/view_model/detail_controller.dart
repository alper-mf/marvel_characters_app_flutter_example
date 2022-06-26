import 'package:dop_flutter_base_project/app/business_logic/api_manager.dart';
import 'package:dop_flutter_base_project/app/components/dialog/info_dialog.dart';
import 'package:dop_flutter_base_project/app/components/dialog/loading_progress.dart';
import 'package:dop_flutter_base_project/app/components/dialog/my_simple_dialog.dart';
import 'package:dop_flutter_base_project/app/components/message/toast_message.dart';
import 'package:dop_flutter_base_project/app/model/response/characters_response.dart';
import 'package:dop_flutter_base_project/core/i10n/i10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/constants/enum/loading_status_enum.dart';

class DetailViewModel extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late final int characterId;
  late Rx<LoadingStatus> _loadingStatus;
  late Rx<CharactersResponseModel> _characterResponse;

  DetailViewModel(int id) {
    _characterResponse = CharactersResponseModel().obs;
    this.characterId = id;
    _loadingStatus = LoadingStatus.init.obs;
    print(id);
  }

  ///Screen'a ait context için kullanılır.
  BuildContext get context => scaffoldKey.currentContext!;

  ///Loading ekranlarında kullanılan enum.
  LoadingStatus get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatus value) => _loadingStatus.value = value;

  ///Karakter listesinin bulunduğu model.
  CharactersResponseModel get characterResponse => _characterResponse.value;
  set characterResponse(CharactersResponseModel val) {
    _characterResponse.value = val;
  }

  @override
  void onReady() {
    super.onReady();
    _ready();
  }

  ///Init işlemlerinin yapıldığı method.
  _ready() async {
    try {
      loadingStatus = LoadingStatus.loading;
      LoadingProgress.showLoading(context);
      await Future.wait([_getCharacterDetail(), _getCharacterComics()]);
      loadingStatus = LoadingStatus.loaded;
      LoadingProgress.done(context);
    } on String catch (e) {
      loadingStatus = LoadingStatus.error;
      LoadingProgress.done(context);
      tryAgainMessage(e);
    } catch (e) {
      loadingStatus = LoadingStatus.error;
      LoadingProgress.done(context);
      tryAgainMessage(AppLocalization.getLabels.defaultErrorMessage);
    }
  }

  ///Karakter detayı çekilir.
  Future<void> _getCharacterDetail() async {
    final param = {
      // "limit": "${(listCount + AppConstants.loadMoreLenght)}",
    };
    try {
      final response = await ApiManager().getCharacterDetail(characterId);
      if (response.status == BaseModelStatus.ok) {
        characterResponse = response.data!;
      } else if (response.status == BaseModelStatus.error) {
        showToastMessage(context, textMessage: response.data.toString());
        characterResponse = CharactersResponseModel();
      }
    } catch (e) {
      print('_getCharacterLists ⛑ ' + e.toString());
      throw '$e';
    }
  }

  ///Karaktere ait romanlar çekilir.
  Future<void> _getCharacterComics() async {
    final param = {
      "limit": "10",
    };
    try {
      final response = await ApiManager().getCharacterComics(characterId);
      if (response.status == BaseModelStatus.ok) {
        //   characterResponseModel = response.data!;
      } else if (response.status == BaseModelStatus.error) {
        showToastMessage(context, textMessage: response.data.toString());
        // characterResponseModel = CharactersResponseModel();
      }
    } catch (e) {
      print('_getCharacterLists ⛑ ' + e.toString());
      throw '$e';
    }
  }

  /// Tekrar yükle popup
  tryAgainMessage(String text) async {
    MyDialog().show(
      context,
      children: [
        InfoDialog(
          isError: true,
          onTap: () {
            Navigator.pop(context);
            _ready();
          },
          message: text,
          btnText: 'Tekrar Dene',
        )
      ],
      barrierDismissible: false,
    );
  }
}
