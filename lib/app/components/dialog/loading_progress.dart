import 'package:flutter/material.dart' show BuildContext, Colors;
import 'package:overlay_loading_progress/overlay_loading_progress.dart' as pr;

class LoadingProgress {
  LoadingProgress.showLoading(BuildContext context) {
    pr.OverlayLoadingProgress.start(context, color: Colors.transparent);
  }

  LoadingProgress.done(BuildContext context) {
    pr.OverlayLoadingProgress.stop(context);
  }
}
