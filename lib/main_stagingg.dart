import 'package:dop_flutter_base_project/app/constants/app/http_url.dart';

import 'app.dart';
import 'app/constants/app/app_constant.dart';
import 'app/constants/enum/general_enum.dart';
import 'app/model/config/environment_config_model.dart';

/// Staging ortamı
///
/// COMMAND LINE örneği
/// flutter run --flavor stagingg lib/main_stagingg.dart
/// flutter build apk --flavor stagingg lib/main_stagingg.dart
void main() {
  run(
    EnvironmentConfigModel(
      appName: AppConstants.appName + AppEnvironment.Staging.name,
      environment: AppEnvironment.Staging,
      apiBaseUrl: HttpUrl.staggingBaseUrl,
    ),
  );
}
