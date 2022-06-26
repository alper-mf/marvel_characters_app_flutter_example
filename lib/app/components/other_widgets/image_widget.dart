import 'package:dop_flutter_base_project/app/model/response/characters_response.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.thumbnail,
    this.boxFit,
  }) : super(key: key);

  final Thumbnail? thumbnail;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      '${thumbnail!.path}.${thumbnail!.extension}',
      fit: boxFit,
    );
  }
}
