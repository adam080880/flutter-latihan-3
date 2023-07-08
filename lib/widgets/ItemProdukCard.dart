import 'package:flutter/material.dart';
import 'package:latihan_3/models/data/produk.dart';

class ItemProductCard extends StatelessWidget {
  final ProdukModel produk;
  final Function handleNavigateToProdukDetail;

  const ItemProductCard({Key? key, required this.produk, required this.handleNavigateToProdukDetail}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateToProdukDetail(context),
      child: Card(
        child: ListTile(
          title: Text(produk.namaproduk!),
          subtitle: Text("Harga jual: ${produk.hargaproduk!}, Harga Beli: ${produk.hargabeliproduk}"),
        )
      )
    );
  }

  navigateToProdukDetail(context) {
    handleNavigateToProdukDetail(produk);
  }
}
