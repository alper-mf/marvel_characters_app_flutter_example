import 'package:dop_flutter_base_project/app/components/app_bar/app_bar.dart';
import 'package:dop_flutter_base_project/app/components/dialog/loading_progress.dart';
import 'package:dop_flutter_base_project/app/components/other_widgets/image_widget.dart';
import 'package:dop_flutter_base_project/app/components/other_widgets/padding.dart';
import 'package:dop_flutter_base_project/app/constants/app/padding_and_radius.dart';
import 'package:dop_flutter_base_project/app/model/response/characters_response.dart';
import 'package:dop_flutter_base_project/app/navigation/size_config.dart';
import 'package:dop_flutter_base_project/app/theme/colors.dart';
import 'package:dop_flutter_base_project/app/theme/text_style.dart';
import 'package:dop_flutter_base_project/core/i10n/i10n.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_model/detail_controller.dart';

class DetailView extends GetView<DetailViewModel> {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: AppColor.dark,
      body: Obx(() {
        if (controller.characterResponse.data == null) {
          return SizedBox();
        }
        final item = controller.characterResponse.data!.results![0];
        return SizedBox.expand(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.height * .4,
                width: SizeConfig.width,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ImageWidget(
                      path: item.thumbnail!.path,
                      extension: item.thumbnail!.extension,
                      boxFit: BoxFit.cover,
                    ),
                    Container(
                      height: SizeConfig.height * .4,
                      width: SizeConfig.width,
                      padding: EdgeInsets.all(paddingXL),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColor.dark.withOpacity(0),
                            AppColor.dark,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name ?? 'No Name',
                            style: s26W700Dark().copyWith(
                              color: AppColor.white,
                            ),
                          ),
                          KPadding(size: .01),
                          Text(
                            'Marvel No: ' + item.id.toString(),
                            style: s14W400Dark().copyWith(
                              color: AppColor.white,
                            ),
                          ),
                          KPadding(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.height * .1,
                      child: MyAppBar(
                        backgroundColor: AppColor.transparent,
                        titleWidget: Text(
                          AppLocalization.getLabels.characterDetail,
                          style: s18W500Dark().copyWith(color: AppColor.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: SizeConfig.height,
                  width: SizeConfig.width,
                  padding: EdgeInsets.all(paddingXL),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      KPadding(),
                      Text(AppLocalization.getLabels.description,
                          style: s18W500Dark().copyWith(
                            color: AppColor.white,
                          )),
                      KPadding(size: .01),
                      Text(
                          item.description != null && item.description != ''
                              ? item.description!
                              : AppLocalization.getLabels.noDescription,
                          style: s14W400Dark().copyWith(
                            color: AppColor.white,
                          )),
                      KPadding(size: .05),
                      Text(AppLocalization.getLabels.last10ComicBooks,
                          style: s18W500Dark().copyWith(
                            color: AppColor.white,
                          )),
                      if (controller.comicBookListModel.data != null) ...[
                        KPadding(size: .01),
                        Text(
                            AppLocalization.getLabels.countLast2005comic +
                                controller.comicBookListModel.data!.total!.toString(),
                            maxLines: 3,
                            style: s14W400Dark().copyWith(
                              color: AppColor.white,
                            )),
                      ],
                      if (controller.comicBookListModel.data == null)
                        Text(AppLocalization.getLabels.noComics,
                            style: s14W400Dark().copyWith(
                              color: AppColor.white,
                            )),
                      KPadding(size: .02),
                      if (controller.comicBookListModel.data != null)
                        SizedBox(
                          height: SizeConfig.height * .2,
                          width: SizeConfig.width,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final item = controller.comicBookListModel.data!.results![index];
                                return Container(
                                  height: 10,
                                  width: SizeConfig.width * .3,
                                  child: ImageWidget(
                                    path: item.thumbnail!.path,
                                    extension: item.thumbnail!.extension,
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  Padding(padding: EdgeInsets.only(right: 20)),
                              itemCount: controller.comicBookListModel.data!.results!.length),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
