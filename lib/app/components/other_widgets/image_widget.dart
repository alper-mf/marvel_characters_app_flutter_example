import 'package:dop_flutter_base_project/app/model/response/characters_response.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.path,
    required this.extension,
    this.boxFit,
  }) : super(key: key);

  final String? path;
  final String? extension;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      '${path}.${extension}',
      fit: boxFit,
    );
  }
}
