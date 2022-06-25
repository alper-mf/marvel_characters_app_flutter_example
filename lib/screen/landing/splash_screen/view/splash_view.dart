import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_model/splash_controller.dart';

class Splash extends GetView<SplashViewModel> {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
    );
  }
}
