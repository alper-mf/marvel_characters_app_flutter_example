import 'dart:ui';

import 'package:dop_flutter_base_project/app/navigation/size_config.dart';
import 'package:dop_flutter_base_project/app/theme/colors.dart';
import 'package:dop_flutter_base_project/screen/home_screen/view_model/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: const [
          _GlowingLightWidget(),
          GlassContainer(),
        ],
      ),
    );
  }
}

class GlassContainer extends StatelessWidget {
  const GlassContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: Container(
        height: SizeConfig.height,
        width: Get.width,
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
      ),
    );
  }
}

class _GlowingLightWidget extends GetView<HomeViewModel> {
  const _GlowingLightWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(shape: BoxShape.circle, color: AppColor.marvelRed.withOpacity(0.9)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 150, sigmaY: 150),
        child: Container(
          height: 150,
          width: 150,
          color: Colors.transparent,
        ),
      ),
    );
  }
}

class GlassWidget extends StatelessWidget {
  final double sigma;
  final double radius;
  final Widget widget;
  const GlassWidget({
    Key? key,
    required this.sigma,
    required this.radius,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(radius)),
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(radius)),
              child: widget)),
    );
  }
}
