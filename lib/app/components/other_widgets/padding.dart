import 'package:dop_flutter_base_project/app/navigation/size_config.dart';
import 'package:flutter/material.dart';

///Default Padding => .02
class KPadding extends StatelessWidget {
  final bool? isHeight;
  final double? size;
  const KPadding({Key? key, this.isHeight, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isHeight != null && isHeight == false) {
      return SizedBox(width: SizeConfig.width * (size ?? .02));
    } else {
      return SizedBox(height: SizeConfig.height * (size ?? .02));
    }
  }
}
