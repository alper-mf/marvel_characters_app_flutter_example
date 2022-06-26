import 'package:dop_flutter_base_project/app/constants/app/app_constant.dart';
import 'package:dop_flutter_base_project/app/controllers/general/session_service.dart';
import 'package:dop_flutter_base_project/core/i10n/default_localization.dart';
import 'package:dop_flutter_base_project/core/i10n/i10n.dart';
import 'package:dop_flutter_base_project/screen/landing/splash_screen/view_model/splash_controller.dart';
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
part '../widget/select_lang.dart';

class WelcomeView extends GetView<WelcomeViewModel> {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      body: ParallaxBG(
          backgroundImage: AssetsImage.marvelBG,
          topWidget: _TopImageWidget(imageURL: AssetsImage.spiderManUpsidedown),
          children: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //Diğer Widgetları eklemeyi unutma.
              _BottomWidget(
                onTapButton: () => controller.onTapToHome(),
              )
            ],
          )),
    );
  }
}
