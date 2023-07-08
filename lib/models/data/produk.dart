class ProdukModel {
  int? id;
  String? namaproduk;
  String? kategorigroupproduk;
  String? kodeproduk;
  int? hargaproduk;
  int? hargabeliproduk;

  ProdukModel({this.id, this.namaproduk, this.kategorigroupproduk, this.kodeproduk, this.hargaproduk, this.hargabeliproduk});

  factory ProdukModel.fromJson(Map<String, dynamic> obj) {
    return ProdukModel(
      id: int.parse(obj['id']),
      kodeproduk: obj['kodeproduk'],
      kategorigroupproduk: obj['kategorigroupproduk'],
      namaproduk: obj['namaproduk'],
      hargaproduk: int.parse(obj['hargaproduk']),
      hargabeliproduk: int.parse(obj['hargabeliproduk']),
    );
  }
}