import 'package:dop_flutter_base_project/app/constants/assets/assets_image.dart';
import 'package:dop_flutter_base_project/app/navigation/size_config.dart';
import 'package:dop_flutter_base_project/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_model/splash_controller.dart';

class Splash extends GetView<SplashViewModel> {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: AppColor.marvelRed,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio:
                  // genişlik/yükseklik
                  SizeConfig.width * 8 / SizeConfig.height * 0.5,
              child: Image.asset(AssetsImage.marvelLogo),
            ),
          ],
        ),
      ),
    );
  }
}
