import 'package:dop_flutter_base_project/app/components/message/error_message_dialog.dart';
import 'package:dop_flutter_base_project/app/extensions/context_extension.dart';
import 'package:dop_flutter_base_project/app/navigation/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../core/i10n/i10n.dart';

class SplashViewModel extends GetxController {
  final GlobalKey scaffoldKey = GlobalKey();

  @override
  void onInit() {
    super.onInit();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  Future<void> _init() async {
    final context = scaffoldKey.currentContext!;
    final future = Future.delayed(const Duration(seconds: 2));

    /// Internet kontrol
    if (!await checkInternet()) return;

    try {
      future.whenComplete(
        () => Navigator.pushNamedAndRemoveUntil(
            context, Screens.instance.main.welcomeScreen, (route) => false),
      );
    } catch (e) {
      debugPrint(e.toString());
      tryAgainMessage(AppLocalization.getLabels.defaultErrorMessage);
    }
  }

  /// Tekrar yükle popup
  tryAgainMessage(String message) {
    ErrorMessageDialog.show(
      text: message,
      barrierDismissible: false,
      buttonText: AppLocalization.getLabels.tryAgainBtnText,
      onTap: () {
        Navigator.pop(scaffoldKey.currentContext!);
        _init();
      },
    );
  }

  /// Internet control
  Future<bool> checkInternet() async {
    final context = scaffoldKey.currentContext!;
    if (await context.checkInternet(context)) {
      return true;
    } else {
      ErrorMessageDialog.show(
        text: 'İnternet bağlantınızı kontrol ediniz.',
        buttonText: 'Tekrar Dene',
        onTap: _init,
      );
      return false;
    }
  }
}
