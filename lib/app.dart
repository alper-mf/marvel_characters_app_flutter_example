import 'dart:async';
import 'package:dop_flutter_base_project/app/constants/app/app_constant.dart';
import 'package:dop_flutter_base_project/core/services/initialize_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app/constants/app/http_url.dart';
import 'app/model/config/environment_config_model.dart';
import 'app/navigation/screens.dart';
import 'app/navigation/size_config.dart';
import 'app/theme/init.dart';
import 'app/theme/app_dark_theme.dart';
import 'app/theme/app_light_theme.dart';
import 'core/i10n/default_localization.dart';
import 'core/i10n/i10n.dart';

/// Tüm proje ortamları bu run Fon. nunu çağırmakta
Future run(EnvironmentConfigModel config) async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitServices().dependencies();
  HttpUrl.baseUrl = config.apiBaseUrl;
  debugPrint('HttpUrl.baseUrl: ' + HttpUrl.baseUrl);
  runApp(MyApp(appName: config.appName));
}

class MyApp extends StatelessWidget {
  final String? appName;

  const MyApp({Key? key, this.appName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        SizeConfig().setScreenSizeFromConstraints(constraints);
        return ValueListenableBuilder<Locale>(
          valueListenable: localeValueNotifier,
          builder: (context, Locale value, _) {
            return MaterialApp(
              navigatorKey: Screens.instance.navigatorKey,
              locale: value,
              supportedLocales: getSupportedLocalList,
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                AppLocalization.delegate
              ],
              builder: (BuildContext context, Widget? child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                  child: child!,
                );
              },
              title: appName ?? AppConstants.appName,
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.light,
              theme: getTheme(AppLightTheme()),
              darkTheme: getTheme(AppDarkTheme()),
              onGenerateRoute: Screens.instance.main.onGenerateRoute,
            );
          },
        );
      },
    );
  }
}
