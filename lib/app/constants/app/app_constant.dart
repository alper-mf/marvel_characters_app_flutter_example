import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  AppConstants._();
  static const String appName = 'Marvel Characters';

  ///Marvel API -> Private KEY
  final privateKey = dotenv.env['privateKey'];

  ///Marvel API -> Public KEY
  final publicKey = dotenv.env['publicKey'];

  /// Türk Para Birimi
  static const String priceUnit = '₺';

  /// Dakika
  static const String minuteUnite = 'dk';

  /// Tasarım Genişlik
  static const double designWith = 375;

  /// Tasarım Yükseklik
  static const double designHeight = 811;

  /// Animasyonlarin Duration Süresi
  static const int animationDurationMS = 400;
}
