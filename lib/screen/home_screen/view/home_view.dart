import 'package:dop_flutter_base_project/app/components/other_widgets/padding.dart';
import 'package:dop_flutter_base_project/app/components/parallax_widget/parallax_bg.dart';
import 'package:dop_flutter_base_project/app/constants/app/padding_and_radius.dart';
import 'package:dop_flutter_base_project/app/constants/assets/assets_image.dart';
import 'package:dop_flutter_base_project/app/navigation/size_config.dart';
import 'package:dop_flutter_base_project/app/theme/colors.dart';
import 'package:dop_flutter_base_project/app/theme/text_style.dart';
import 'package:dop_flutter_base_project/screen/home_screen/view_model/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      key: controller.scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: SizedBox.square(
          dimension: SizeConfig.blockSizeHorizontal * 30,
          child: Image.asset(
            AssetsImage.marvelLogo,
          ),
        ),
      ),
      body: SizedBox.expand(
        child: Obx(
          () => SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(paddingXL),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (controller.characterResponseModel.data != null)
                    Expanded(
                        child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: SizeConfig.height * .03,
                        crossAxisSpacing: SizeConfig.width * .04,
                        mainAxisExtent: SizeConfig.height * .3,
                      ),
                      controller: controller.scrollController,
                      padding: EdgeInsets.only(top: paddingXL),
                      itemCount: controller.characterResponseModel.data!.results!.length,
                      itemBuilder: (context, index) {
                        final item = controller.characterResponseModel.data!.results![index];
                        return DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radiusXXS),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    '${item.thumbnail!.path}.${item.thumbnail!.extension}',
                                  ))),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              KPadding(isHeight: false),
                              Flexible(
                                child: Container(
                                  height: SizeConfig.height * .1,
                                  width: SizeConfig.width,
                                  padding: EdgeInsets.all(paddingM),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColor.background.withOpacity(0),
                                        AppColor.background.withOpacity(0.8),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        item.name ?? '',
                                        style: s16W400Dark(),
                                      ),
                                      KPadding(size: .01),
                                      Text(
                                        item.comics!.items == null
                                            ? ''
                                            : item.comics!.items!.length > 0
                                                ? item.comics!.items![0].name!
                                                : '',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: s12W400Dark(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              KPadding(isHeight: false, size: .05)
                            ],
                          ),
                        );
                      },
                    ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
