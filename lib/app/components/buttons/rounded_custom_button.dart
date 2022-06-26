import 'package:dop_flutter_base_project/app/navigation/size_config.dart';
import 'package:dop_flutter_base_project/app/theme/colors.dart';
import 'package:flutter/material.dart';

class RoundedCustomButton extends StatelessWidget {
  final bool? isOutlined;
  final bool? isDisabled;
  final String? title;
  final Widget? widget;
  final Color? color;
  final VoidCallback onTap;
  final double? borderRadius;
  final double? kHeight;
  final double? kWidth;
  const RoundedCustomButton({
    Key? key,
    this.isDisabled,
    this.isOutlined,
    this.color,
    this.title,
    this.widget,
    this.kWidth,
    this.borderRadius,
    this.kHeight,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kHeight ?? SizeConfig.height * .1,
      width: kWidth,
      child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double?>(0),
            backgroundColor: MaterialStateProperty.all(
              color == null
                  ? AppColor.primary
                  : isDisabled == true
                      ? AppColor.disabledButtonColor
                      : isOutlined == true
                          ? Colors.transparent
                          : color ?? Colors.transparent,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder?>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20)),
                  side: BorderSide(
                    color: color == null
                        ? AppColor.primary
                        : isDisabled != null && isDisabled == true
                            ? AppColor.marvelRed
                            : isOutlined != null && isOutlined == true
                                ? AppColor.darkText
                                : color!,
                    width: isOutlined != null && isOutlined == true ? 1 : 0,
                  )),
            ),
          ),
          /**
           *  isDisabled == true
                        ? AppColor.disabledButtonColor
                        : isOutlined == null
                            ? color == null
                                ? AppColor.secondaryColor
                                : color!
                            : AppColor.darkText,
           */
          child: widget ??
              Text(
                title ?? 'Title or widget not added',
                style: TextStyle(
                  color: isDisabled == true
                      ? AppColor.darkText
                      : isOutlined != null
                          ? isOutlined!
                              ? AppColor.darkText
                              : color != null
                                  ? Colors.white
                                  : color
                          : Colors.white,
                ),
              )),
    );
  }
}
