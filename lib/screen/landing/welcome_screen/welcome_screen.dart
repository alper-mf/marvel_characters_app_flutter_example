import 'package:dop_flutter_base_project/screen/landing/welcome_screen/view_model/welcome_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/welcome_view.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: WelcomeViewModel(),
      builder: (_) => const WelcomeView(),
    );
  }
}
