import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  static final AppCache _instance = AppCache._private();

  static AppCache get instance {
    return _instance;
  }

  static SharedPreferences? _prefs;

  static const String _KEY_USER = "userModel";
  static const String _KEY_TOKEN = "token";
  static const String _KEY_CART = "CART";

  AppCache._private();

 Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> logout() async {
    await _prefs!.remove(_KEY_USER);
    await _prefs!.remove(_KEY_TOKEN);
  }

  void setApiToken(String? token) async {
    if (token == null) return;
    await _prefs!.setString(_KEY_TOKEN, token);
  }

  String? getApiToken() {
    String? token = _prefs!.get(_KEY_TOKEN) as String?;
    return token;
  }

  void setArchive(String? archive, int id) async {
    if (archive == null) return;
    await _prefs!.setString('${_KEY_CART} ${id}', archive);
  }

  String? getField(int id) {
    return _prefs!.getString('${_KEY_CART} ${id}');
  }

}