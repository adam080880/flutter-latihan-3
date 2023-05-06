class ProdukModel {
  int? id;
  String? namaproduk;
  String? kodeproduk;
  int? hargaproduk;

  ProdukModel({this.id, this.namaproduk, this.kodeproduk, this.hargaproduk});

  factory ProdukModel.fromJson(Map<String, dynamic> obj) {
    return ProdukModel(
      id: obj['data']['id'],
      kodeproduk: obj['data']['kodeproduk'],
      namaproduk: obj['data']['namaproduk'],
      hargaproduk: obj['data']['hargaproduk']
    );
  }
}