import 'package:dop_flutter_base_project/app/business_logic/api_manager.dart';
import 'package:dop_flutter_base_project/app/components/dialog/info_dialog.dart';
import 'package:dop_flutter_base_project/app/components/dialog/loading_progress.dart';
import 'package:dop_flutter_base_project/app/components/dialog/my_simple_dialog.dart';
import 'package:dop_flutter_base_project/app/components/message/toast_message.dart';
import 'package:dop_flutter_base_project/app/constants/app/app_constant.dart';
import 'package:dop_flutter_base_project/app/constants/enum/loading_status_enum.dart';
import 'package:dop_flutter_base_project/app/model/response/characters_response.dart';
import 'package:dop_flutter_base_project/app/navigation/screens.dart';
import 'package:dop_flutter_base_project/core/i10n/i10n.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController with GetTickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Rx<CharactersResponseModel> _characterResponse;

  late Rx<LoadingStatus> _loadingStatus;
  late ScrollController scrollController;
  RxList<String> items = List.generate(10, (index) => 'Hello $index').obs;

  final RxInt listCount = 0.obs;

  int offset = 0;

  HomeViewModel() {
    _characterResponse = CharactersResponseModel().obs;
    _loadingStatus = LoadingStatus.init.obs;
    scrollController = ScrollController()..addListener((() => _scrollListener()));
  }

  ///Screen'a ait context için kullanılır.
  BuildContext get context => scaffoldKey.currentContext!;

  ///Karakter listesinin bulunduğu model.
  CharactersResponseModel get characterResponse => _characterResponse.value;
  set characterResponse(CharactersResponseModel val) {
    _characterResponse.value = val;
  }

  ///Loading ekranlarında kullanılan enum.
  LoadingStatus get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatus value) => _loadingStatus.value = value;

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
      await Future.wait([
        _getCharacterLists(),
      ]);
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

  ///Karakter detay sayfasını açar.
  void onTapCharacterDetail(int characterId) async {
    Navigator.pushNamed(context, Screens.instance.main.detailScreen, arguments: characterId);
  }

  ///Liste için kullanılan listener.
  Future<void> _scrollListener() async {
    print(scrollController.position.extentAfter);
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      LoadingProgress.showLoading(context);
      await _getCharacterLists();
      print('----------->' + characterResponse.data!.results!.length.toString());
      LoadingProgress.done(context);
    }
  }

  ///Karakter listesinin çekildiği method.
  Future<void> _getCharacterLists() async {
    final limit = listCount + AppConstants.loadMoreLenght;
    if (limit > 100) {
      offset = (offset + 100);
      listCount.value = 30;
    }
    final param = {"limit": "$limit", "offset": "$offset"};
    try {
      final response = await ApiManager().getCharacterList(param);
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
