import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  final String? productCode;
  final String? productName;
  final int? productPrice;
  final int? productStock;

  const ProductDetail({Key? key, this.productCode, this.productName, this.productPrice, this.productStock}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Produk')),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Kode Produk: ${widget.productCode}'),
            Text('Nama Produk: ${widget.productName}'),
            Text('Harga Produk: ${widget.productPrice}'),
            Text('Stok Produk: ${widget.productStock}'),
      ]))
    );
  }
}
