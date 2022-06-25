import 'dart:developer';
import 'package:dop_flutter_base_project/screen/home_screen/home_screen.dart';
import 'package:dop_flutter_base_project/screen/landing/welcome_screen/welcome_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

import '../../screen/landing/splash_screen/splash_screen.dart';
import 'page_navigation.dart';

class Screens with PageNavigation {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static Screens? _screens;
  late final _MainScreens main;

  Screens._() {
    main = _MainScreens();
  }

  static Screens get instance {
    _screens ??= Screens._();
    return _screens!;
  }

  static BuildContext get context => _screens!.navigatorKey.currentContext!;

  restartApp() async {
    await Get.deleteAll();
    navigatorKey.currentState!.pushNamedAndRemoveUntil(main.init, (route) => false);
  }
}

class _MainScreens with PageNavigation {
  final String init = '/';
  final String welcomeScreen = _getMainScreenName('welcomeScreen');
  final String homeScreen = _getMainScreenName('homeScreen');

  Route<dynamic>? onGenerateRoute(RouteSettings setting) {
    if (setting.name == init) {
      return goToPage(const SplashScreen(), setting);
    } else if (setting.name == welcomeScreen) {
      return goToPage(WelcomeScreen(), setting);
    } else if (setting.name == homeScreen) {
      return goToPage(HomeScreen(), setting);
    } else {
      return returnUnknownPageRoute(setting);
    }
  }
}

String _getMainScreenName(String screenName) {
  var value = '/$screenName';
  log(value, name: 'received_return_request_screen Name In Route');
  return value;
}
