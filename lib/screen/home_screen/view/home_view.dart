import 'package:dop_flutter_base_project/app/components/background/background_widget.dart';
import 'package:dop_flutter_base_project/app/components/other_widgets/padding.dart';

import 'package:dop_flutter_base_project/app/constants/app/padding_and_radius.dart';
import 'package:dop_flutter_base_project/app/constants/assets/assets_image.dart';

import 'package:dop_flutter_base_project/app/extensions/widget_extension.dart';
import 'package:dop_flutter_base_project/app/model/response/characters_response.dart';
import 'package:dop_flutter_base_project/app/navigation/size_config.dart';
import 'package:dop_flutter_base_project/app/theme/colors.dart';
import 'package:dop_flutter_base_project/app/theme/text_style.dart';
import 'package:dop_flutter_base_project/core/i10n/i10n.dart';
import 'package:dop_flutter_base_project/screen/home_screen/view_model/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part '../widget/grid_view.dart';

class HomeView extends GetView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.dark,
      key: controller.scaffoldKey,
      body: SizedBox.expand(
        child: Stack(
          children: [
            BackgroundWidget(),
            Obx(
              () => SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(paddingXL),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: SizeConfig.height * .07,
                          child: Image.asset(AssetsImage.marvelLogo)),
                      KPadding(),
                      _GridView()
                    ],
                  ).isVisible(controller.characterResponse.data != null ? true : false),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
