import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/home_controller.dart';
import 'view/home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (_) => const Home(),
    );
  }
}