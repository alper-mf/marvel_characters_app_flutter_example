import 'package:dop_flutter_base_project/app/components/other_widgets/image_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_model/detail_controller.dart';

class DetailView extends GetView<DetailViewModel> {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = controller.characterResponse.data!.results![0];
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        title: Text(controller.characterId.toString()),
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            ImageWidget(
              thumbnail: item.thumbnail,
            )
          ],
        ),
      ),
    );
  }
}
