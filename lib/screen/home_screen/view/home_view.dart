import 'package:dop_flutter_base_project/app/components/other_widgets/padding.dart';
import 'package:dop_flutter_base_project/app/components/parallax_widget/parallax_bg.dart';
import 'package:dop_flutter_base_project/app/constants/app/padding_and_radius.dart';
import 'package:dop_flutter_base_project/app/constants/assets/assets_image.dart';
import 'package:dop_flutter_base_project/app/navigation/size_config.dart';
import 'package:dop_flutter_base_project/app/theme/colors.dart';
import 'package:dop_flutter_base_project/screen/home_screen/view_model/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      body: SizedBox.expand(
        child: Obx(
          () => ParallaxBG(
            backgroundImage: AssetsImage.marvelBG,
            children: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(paddingXL),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColor.background,
                          borderRadius: BorderRadius.circular(radiusL),
                          border: Border.all(color: AppColor.black.withOpacity(0.3))),
                      child: Row(
                        children: [
                          KPadding(isHeight: false),
                          SizedBox.square(
                            dimension: SizeConfig.blockSizeHorizontal * 30,
                            child: Image.asset(
                              AssetsImage.marvelLogo,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: ListView.separated(
                      controller: controller.scrollController,
                      padding: EdgeInsets.only(top: paddingXL),
                      itemCount: controller.items.length,
                      itemBuilder: (context, index) {
                        final item = controller.items[index];
                        return Container(
                          height: SizeConfig.height * .15,
                          width: SizeConfig.width,
                          color: AppColor.background,
                          child: Center(child: Text(item)),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          Padding(padding: EdgeInsets.only(bottom: paddingXL)),
                    ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
