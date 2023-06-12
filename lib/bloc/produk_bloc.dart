import 'dart:convert';
import 'package:latihan_3/models/data/produk.dart';
import 'package:latihan_3/helpers/api.dart';
import 'package:latihan_3/helpers/api_url.dart';

class ProdukBloc {
  static Future<List<ProdukModel>> getProduks() async {
    String apiUrl = ApiUrl.listProduk;
    var response = await Api().get(apiUrl);
    var jsonObj = json.decode(response.body);

    List<dynamic> listProduk = (jsonObj as Map<String, dynamic>)['data'];
    List<ProdukModel> produks = [];

    for (int i = 0; i < listProduk.length; i++) {
      produks.add(ProdukModel.fromJson(listProduk[i]));
    }

    return produks;
  }

  static Future addProduk({ProdukModel? produk}) async {
    String apiUrl = ApiUrl.createProduk;
    var body = {
      "kode_produk": produk!.kodeproduk,
      "nama_produk": produk.namaproduk,
      "harga": produk.hargaproduk.toString()
    };

    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return jsonObj['status'];
  }

  static Future<bool> updateProduk({required ProdukModel produk}) async {
    String apiUrl = ApiUrl.updateProduk(produk.id!);

    var body = {
      "kode_produk": produk.kodeproduk,
      "nama_produk": produk.namaproduk,
      "harga": produk.hargaproduk.toString()
    };

    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return jsonObj['data'];
  }

  static Future<bool> deleteProduk({int? id}) async {
    String apiUrl = ApiUrl.deleteProduk(id!);

    var response = await Api().delete(apiUrl);
    var jsonObj = json.decode(response.body);
    return (jsonObj as Map<String, dynamic>)['data'];
  }
}