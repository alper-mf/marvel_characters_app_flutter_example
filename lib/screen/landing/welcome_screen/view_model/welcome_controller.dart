import 'package:dop_flutter_base_project/app/navigation/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeViewModel extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext get context => scaffoldKey.currentContext!;

  onTapToHome() {
    Navigator.pushNamed(context, Screens.instance.main.homeScreen);
  }
}
