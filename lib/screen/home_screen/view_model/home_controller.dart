import 'package:dop_flutter_base_project/app/business_logic/api_manager.dart';
import 'package:dop_flutter_base_project/app/components/dialog/info_dialog.dart';
import 'package:dop_flutter_base_project/app/components/dialog/loading_progress.dart';
import 'package:dop_flutter_base_project/app/components/dialog/my_simple_dialog.dart';
import 'package:dop_flutter_base_project/app/components/message/toast_message.dart';
import 'package:dop_flutter_base_project/app/constants/app/app_constant.dart';
import 'package:dop_flutter_base_project/app/constants/enum/loading_status_enum.dart';
import 'package:dop_flutter_base_project/app/model/response/characters_response.dart';
import 'package:dop_flutter_base_project/core/i10n/i10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Rx<CharactersResponseModel> _characterListModel;
  late Rx<LoadingStatus> _loadingStatus;
  late ScrollController scrollController;
  RxList<String> items = List.generate(10, (index) => 'Hello $index').obs;

  final RxInt listCount = 0.obs;

  HomeViewModel() {
    _characterListModel = CharactersResponseModel().obs;
    _loadingStatus = LoadingStatus.init.obs;
    scrollController = ScrollController()..addListener((() => _scrollListener()));
  }

  ///Genel Context için kullanılır.
  BuildContext get context => scaffoldKey.currentContext!;

  ///Karakter listesinin bulunduğu model.
  CharactersResponseModel get characterResponseModel => _characterListModel.value;
  set characterResponseModel(CharactersResponseModel val) {
    _characterListModel.value = val;
  }

  ///Loading ekranlarında kullanılan enum.
  LoadingStatus get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatus value) => _loadingStatus.value = value;

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  ///Init işlemlerinin yapıldığı method.
  _init() async {
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

  ///Liste için kullanılan listener.
  Future<void> _scrollListener() async {
    print(scrollController.position.extentAfter);
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      LoadingProgress.showLoading(context);
      await _getCharacterLists();
      print('----------->' + characterResponseModel.data!.results!.length.toString());
      LoadingProgress.done(context);
    }
  }

  ///Karakter listesinin çekildiği method.
  Future<void> _getCharacterLists() async {
    final param = {
      "limit": "${(listCount + AppConstants.loadMoreLenght)}",
    };
    try {
      final response = await ApiManager().getList(param);
      if (response.status == BaseModelStatus.ok) {
        characterResponseModel = response.data!;
      } else if (response.status == BaseModelStatus.error) {
        showToastMessage(context, textMessage: response.data.toString());
        characterResponseModel = CharactersResponseModel();
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
            _init();
          },
          message: text,
          btnText: 'Tekrar Dene',
        )
      ],
      barrierDismissible: false,
    );
  }
}
