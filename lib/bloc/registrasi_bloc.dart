import 'dart:convert';
import 'package:latihan_3/helpers/api.dart';
import 'package:latihan_3/helpers/api_url.dart';
import 'package:latihan_3/models/auth/registrasi.dart';

class RegistrasiBloc {
  static Future<RegistrasiModel> registrasi({String? nama, String? email, String? password}) async {
    String apiUrl = ApiUrl.registrasi;

    var body = {"nama": nama, "email": email, "password": password};
    
    var registrasiRawResponse = await Api().post(apiUrl, body);
    var registrasiResponse = json.decode(registrasiRawResponse.body);

    return RegistrasiModel.fromJson(registrasiResponse);
  }
}
