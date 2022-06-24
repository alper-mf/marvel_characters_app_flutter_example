import '../constants/app/app_constant.dart';

import '../navigation/size_config.dart';

/// [horizontalScale] Font size ları ölçeklendirmek için kullanılmakta
extension WidgetsScale on num {
  double get horizontalScale => this * (SizeConfig.width / AppConstants.designWith);
  double get verticalScale => this * (SizeConfig.height / AppConstants.designHeight);
}
