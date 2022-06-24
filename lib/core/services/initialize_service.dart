import 'dart:async';
import 'package:dop_flutter_base_project/app/controllers/general/session_service.dart';
import 'package:dop_flutter_base_project/app/libs/locale_manager/locale_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

/// Servislerin initialize edildiği yer

class InitServices extends Bindings {
  @override
  Future<void> dependencies() async {
    await _getxController();
    await LocaleManager.cacheInit();
    await _fbServices();

    ///Android Status bardaki renklerin yönetimi için kullanılıyor.
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: Colors.transparent,
    ));

    /// Telefonu sağa ya da sola çevirdiğimiz de lanscape moda geçmemesi için eklendi.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    ///Environments initialize
    await dotenv.load(fileName: ".env");
  }

  //Getx de initialize yapılacak olan controller ın tutulduğu yer.
  static Future<void> _getxController() async {
    Get.put(SessionService());
  }

  //firebase servislerinin initialize ının yapıldığı yer.
  static Future<void> _fbServices() async {}
}
