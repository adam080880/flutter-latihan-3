import 'package:shared_preferences/shared_preferences.dart';

class UserInfo {
  Future setToken(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.setString('token', value);
  }

  Future<String?> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.getString('token');
  }

  Future setUserID(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.setString('userID', value);
  }

  Future<String?> getUserID() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.getString('userID');
  }

  Future logout() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    pref.clear();
  }
}
