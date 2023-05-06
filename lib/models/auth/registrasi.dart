class RegistrasiModel {
  int? code;
  bool? status;
  String? data;

  RegistrasiModel({this.code, this.status, this.data});

  factory RegistrasiModel.fromJson(Map<String, dynamic> obj) {
    return RegistrasiModel(
      code: obj['code'],
      status: obj['status'],
      data: obj['data']
    );
  }
}
