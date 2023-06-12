class RegistrasiModel {
  int? code;
  bool? status;
  String? message;

  RegistrasiModel({this.code, this.status, this.message});

  factory RegistrasiModel.fromJson(Map<String, dynamic> obj) {
    return RegistrasiModel(
      code: obj['code'],
      status: obj['status'],
      message: obj['message']
    );
  }
}
