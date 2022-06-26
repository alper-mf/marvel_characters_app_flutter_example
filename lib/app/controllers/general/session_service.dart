import 'package:get/get.dart';
import '../../constants/enum/cache_key_enum.dart';
import '../../libs/locale_manager/locale_manager.dart';

class SessionService extends GetxController {
  final Rx<bool?> _loggedIn = Rx(null);
  String? _token;

  int? _languageCode;

  String? getUserToken() {
    _token ??= LocaleManager.instance.getStringValue(CacheKey.token);
    return _token;
  }

  Future<void> setUserToken(String value) async {
    await LocaleManager.instance.setStringValue(CacheKey.token, value);
    _token = value;
  }

  int? getLanguageCode() {
    _languageCode ??= LocaleManager.instance.getIntValue(CacheKey.languageCode);
    return _languageCode;
  }

  Future<void> setLanguageCode(int value) async {
    await LocaleManager.instance.setIntValue(CacheKey.languageCode, value);
    _languageCode = value;
  }

  /// Kullanıcının authentice olup olmadığını local de kontrol eder auth ise true döner
  bool isUserLogin() {
    if (_loggedIn.value == null) {
      bool value = LocaleManager.instance.getBoolValue(CacheKey.loggedIn) ?? false;
      _loggedIn.value = value;
    }
    return _loggedIn.value!;
  }

  Future<void> setLoggedIn(bool value) async {
    await LocaleManager.instance.setBoolValue(CacheKey.loggedIn, value);
    _loggedIn.value = value;
  }

  /// Kullanıcı çıkış yaptığında çağırılır.
  Future<void> logOut() async {
    await Future.wait([
      LocaleManager.instance.removeAt(CacheKey.token),
      setLoggedIn(false),
    ]);
  }
}
