import 'package:flutter_dotenv/flutter_dotenv.dart';

///HASH Oluşturabilmek için uygulamaya ait dökümantasyona bakın.

class AppConstants {
  AppConstants();
  static const String appName = 'Marvel Characters';

  ///Marvel API -> Hash KEY
  final hash = dotenv.env['hash'];

  ///Marvel API -> Public KEY
  final publicKey = dotenv.env['publicKey'];

  /// Tasarım Genişlik
  static const double designWith = 375;

  /// Tasarım Yükseklik
  static const double designHeight = 811;

  /// Animasyonlarin Duration Süresi
  static const animationDurationMS = Duration(milliseconds: 400);

  ///Font Family = SourceSansPro
  static const String fontFamily = 'SourceSansPro';
}
