class ProdukModel {
  int? id;
  String? namaproduk;
  String? kodeproduk;
  int? hargaproduk;

  ProdukModel({this.id, this.namaproduk, this.kodeproduk, this.hargaproduk});

  factory ProdukModel.fromJson(Map<String, dynamic> obj) {
    return ProdukModel(
      id: int.parse(obj['id']),
      kodeproduk: obj['kodeproduk'],
      namaproduk: obj['namaproduk'],
      hargaproduk: int.parse(obj['hargaproduk'])
    );
  }
}