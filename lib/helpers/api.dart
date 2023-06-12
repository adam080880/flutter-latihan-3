import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:latihan_3/helpers/user_info.dart';
import 'app_exception.dart';

class Api {
  Future<dynamic> post(dynamic url, dynamic data) async {
    String? token = await UserInfo().getToken();
    dynamic responseJson;

    try {
      final response = await http.post(
        Uri.parse(url),
        body: data,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"}
      );

      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  Future<dynamic> get(dynamic url) async {
    String? token = await UserInfo().getToken();
    dynamic responseJson;

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"}
      );

      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  Future<dynamic> delete(dynamic url) async {
    String? token = await UserInfo().getToken();
    dynamic responseJson;

    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"}
      );

      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        return BadrequestException(response.body.toString());
      case 401:
      case 403:
        return UnauthorizedException(response.body.toString());
      case 422:
        return InvalidInputException(response.body.toString());
      case 500:
      default:
        return FetchDataException('Error occured while communication with server with statuscode:${response.statusCode}');
    }
  }
}
