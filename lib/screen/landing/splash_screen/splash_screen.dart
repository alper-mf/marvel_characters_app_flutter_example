import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/navigation/size_config.dart';
import 'view_model/splash_controller.dart';
import 'view/splash_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return GetBuilder(
      init: SplashViewModel(),
      builder: (_) => const Splash(),
    );
  }
}
