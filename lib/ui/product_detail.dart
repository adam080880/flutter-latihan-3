import 'package:flutter/material.dart';
import 'package:latihan_3/models/data/produk.dart';
import 'package:latihan_3/ui/product_form.dart';

class ProductDetail extends StatefulWidget {
  final ProdukModel produk;

  const ProductDetail({Key? key, required this.produk}) : super(key: key);

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Kode Produk: ${widget.produk.kodeproduk}'),
            Text('Nama Produk: ${widget.produk.namaproduk}'),
            Text('Harga Produk: ${widget.produk.hargaproduk}'),
            const Padding(padding: EdgeInsets.only(bottom: 8)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                    ),
                    child: const Text('Edit', style: TextStyle(color: Colors.black)),
                    onPressed: () => {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ProductForm(product: widget.produk))
                      )
                    },
                  )
                ),
                const Padding(padding: EdgeInsets.only(right: 16)),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => {
                      Navigator.pop(context)
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text('Hapus'),
                  )
                )
              ],
            )
          ]
        )
      )
    );
  }
}
