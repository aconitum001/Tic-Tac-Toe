import 'package:shared_preferences/shared_preferences.dart';

class PrefrencesService {
  static String kFirstLaunch = "firstLaunch";

  static Future<void> setFirstLaunch({required bool firstLaunch}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(kFirstLaunch, firstLaunch);
  }

  static Future<bool> isFirstLaunch() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(kFirstLaunch) ?? true;
  }
}
