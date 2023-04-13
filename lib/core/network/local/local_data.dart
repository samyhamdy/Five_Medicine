import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  static SharedPreferences? _preferences;
  static PrefService? _instance;

  static Future<PrefService> getInstance() async {
    _instance = PrefService();
    _preferences = await SharedPreferences.getInstance();
    return _instance!;
  }

  bool get isAuthenticated => _preferences?.getBool('isAuthenticated') ?? false;
  set isAuthenticated(bool value) =>
      _preferences?.setBool('isAuthenticated', value);
}
