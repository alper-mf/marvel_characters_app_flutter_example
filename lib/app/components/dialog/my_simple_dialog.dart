import 'package:dop_flutter_base_project/app/components/dialog/app_dialog.dart';
import 'package:flutter/material.dart';

class MyDialog {
  Future show(BuildContext context,
      {Widget? title, List<Widget>? children, EdgeInsets? padding, bool? barrierDismissible}) {
    return AppDialog().showDynamicDialog(
      barrierColor: Colors.black45,
      barrierDismissible: barrierDismissible,
      widget: SimpleDialog(
        title: title,
        titlePadding: EdgeInsets.zero,
        backgroundColor: Theme.of(context).cardColor,
        contentPadding: padding ?? const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        children: children,
      ),
    );
  }
}
