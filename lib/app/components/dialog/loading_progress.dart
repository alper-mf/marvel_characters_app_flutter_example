import 'package:dop_flutter_base_project/app/constants/assets/assets_anim.dart';
import 'package:dop_flutter_base_project/app/navigation/size_config.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart' as pr;

class LoadingProgress {
  LoadingProgress.showLoading(BuildContext context) {
    pr.OverlayLoadingProgress.start(context,
        color: Colors.transparent,
        widget: SizedBox.square(
            dimension: SizeConfig.blockSizeVertical * 24,
            child: LottieBuilder.asset(
              AssetsAnimation.spideyLoading,
            )));
  }

  LoadingProgress.done(BuildContext context) {
    pr.OverlayLoadingProgress.stop(context);
  }
}
