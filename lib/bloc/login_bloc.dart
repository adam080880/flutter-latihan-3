import 'dart:convert';
import 'package:latihan_3/helpers/api.dart';
import 'package:latihan_3/helpers/api_url.dart';
import 'package:latihan_3/models/auth/login.dart';

class LoginBloc {
  static Future<LoginModel> login({String? email, String? password}) async {
    String apiUrl = ApiUrl.login;

    dynamic body = {"email": email, "password": password};
    
    dynamic loginRawResponse = await Api().post(apiUrl, body);
    dynamic loginResponse = json.decode(loginRawResponse.body);

    return LoginModel.fromJson(loginResponse);
  }
}
