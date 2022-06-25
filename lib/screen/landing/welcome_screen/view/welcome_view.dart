import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_model/welcome_controller.dart';
import 'package:dop_flutter_base_project/app/components/buttons/rounded_custom_button.dart';
import 'package:dop_flutter_base_project/app/components/other_widgets/padding.dart';
import 'package:dop_flutter_base_project/app/components/parallax_widget/parallax_bg.dart';
import 'package:dop_flutter_base_project/app/constants/app/padding_and_radius.dart';
import 'package:dop_flutter_base_project/app/constants/assets/assets_image.dart';
import 'package:dop_flutter_base_project/app/navigation/size_config.dart';
import 'package:dop_flutter_base_project/app/theme/colors.dart';
import 'package:dop_flutter_base_project/app/theme/text_style.dart';

part '../widget/top_image.dart';
part '../widget/bottom_widget.dart';

class WelcomeView extends GetView<WelcomeViewModel> {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      body: ParallaxBG(
          backgroundImage: AssetsImage.marvelBG,
          topWidget: _TopImageWidget(imageURL: AssetsImage.spiderManUpsidedown),
          children: Align(
            alignment: Alignment.bottomCenter,
            child: _BottomWidget(
              onTapButton: () => controller.onTapToHome(),
            ),
          )),
    );
  }
}
