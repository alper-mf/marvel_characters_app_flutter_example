import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
  
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(),
      body: Container(),
    );
  }
}