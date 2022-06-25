import 'package:dop_flutter_base_project/app/components/buttons/rounded_custom_button.dart';
import 'package:dop_flutter_base_project/app/constants/assets/assets_anim.dart';
import 'package:dop_flutter_base_project/app/navigation/size_config.dart';
import 'package:dop_flutter_base_project/app/theme/colors.dart';
import 'package:dop_flutter_base_project/app/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class InfoDialog extends StatelessWidget {
  final String? message;
  final VoidCallback? onTap;
  final bool isError;
  final String? btnText;
  final bool? isQuestionDialog;
  const InfoDialog(
      {Key? key,
      this.message,
      this.onTap,
      this.isQuestionDialog,
      required this.isError,
      this.btnText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox.square(
          dimension: SizeConfig.height * .12,
          child: LottieBuilder.asset(
            isError ? AssetsAnimation.error : AssetsAnimation.wellDone,
            repeat: false,
          ),
        ),
        SizedBox(height: SizeConfig.height * .01),
        Text(
          message!,
          textAlign: TextAlign.center,
          style: s14W400Dark(),
        ),
        SizedBox(height: SizeConfig.height * .03),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (isQuestionDialog != null && isQuestionDialog == true)
              RoundedCustomButton(
                kHeight: SizeConfig.height * .069,
                onTap: () => Navigator.pop(context),
                color: AppColor.primary,
                borderRadius: 6,
                isOutlined: true,
                widget: Text(
                  'İptal',
                  style: s14W400Dark(),
                ),
              ),
            RoundedCustomButton(
              kHeight: SizeConfig.height * .069,
              onTap: onTap ?? () => Navigator.pop(context),
              color: AppColor.disabledButtonColor,
              borderRadius: 6,
              widget: Text(
                onTap == null ? 'Tamam' : btnText ?? 'Devam Et',
                style: s14W400Dark(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
