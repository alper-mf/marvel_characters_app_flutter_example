import 'package:dop_flutter_base_project/screen/home_screen/view_model/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/home_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeViewModel(),
      builder: (_) => const HomeView(),
    );
  }
}
