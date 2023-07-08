import 'package:flutter/material.dart';
import 'package:latihan_3/bloc/produk_bloc.dart';
import 'package:latihan_3/models/data/produk.dart';
import 'package:latihan_3/ui/product_form.dart';

class ProductDetail extends StatefulWidget {
  final ProdukModel produk;
  final dynamic loadProducts;

  const ProductDetail({Key? key, required this.produk, this.loadProducts}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool _loading = false;

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Produk')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Kode Produks: ${widget.produk.kodeproduk}'),
            Text('Kode Produk: ${widget.produk.kategorigroupproduk}'),
            Text('Nama Produk: ${widget.produk.namaproduk}'),
            Text('Harga Produk: ${widget.produk.hargaproduk}'),
            Text('Harga Beli Produk: ${widget.produk.hargabeliproduk}'),
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
                        MaterialPageRoute(builder: (context) => ProductForm(product: widget.produk, loadProducts: widget.loadProducts))
                      )
                    },
                  )
                ),
                const Padding(padding: EdgeInsets.only(right: 16)),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _loading ? null : () async {
                      setState(() {
                        _loading = true;
                      });

                      try {
                        await ProdukBloc.deleteProduk(id: widget.produk.id);
                        await widget.loadProducts();

                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);

                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text("Berhasil hapus produk"),
                          showCloseIcon: true,
                          closeIconColor: Colors.white,
                        ));
                      } catch (error) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text("Galat hapus produk"),
                          showCloseIcon: true,
                          closeIconColor: Colors.white,
                        ));
                      } finally {
                        setState(() {
                          _loading = false;
                        });
                      }
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
