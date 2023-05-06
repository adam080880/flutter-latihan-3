class LoginModel {
  int? code;
  bool? status;
  String? token;
  int? userID;
  String? userEmail;

  LoginModel({this.code, this.status, this.token, this.userID, this.userEmail});

  factory LoginModel.fromJson(Map<String, dynamic> obj) {
    return LoginModel(
      code: obj['code'],
      status: obj['status'],
      token: obj['data']['token'],
      userID: obj['data']['user']['id'],
      userEmail: obj['data']['user']['email']
    );
  }
}
