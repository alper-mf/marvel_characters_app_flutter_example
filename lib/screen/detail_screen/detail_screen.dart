import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view_model/detail_controller.dart';
import 'view/detail_view.dart';

class DetailScreen extends StatelessWidget {
  final int characterId;
  const DetailScreen({Key? key, required this.characterId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DetailViewModel(characterId),
      builder: (_) => const DetailView(),
    );
  }
}
