import 'package:flutter/material.dart';
import 'package:latihan_3/models/data/produk.dart';
import 'package:latihan_3/ui/product_detail.dart';
import 'package:latihan_3/ui/product_form.dart';
import 'package:latihan_3/widgets/ItemProdukCard.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Produk')),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Logout'),
              trailing: const Icon(Icons.logout),
              onTap: () async {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          ItemProductCard(
            produk: ProdukModel(
              id: 1,
              kodeproduk: 'A001',
              namaproduk: 'Kamera',
              hargaproduk: 5000000
            ),
            handleNavigateToProdukDetail: (targetProduct) => {
              handleNavigateToProdukDetail(targetProduct)
            },
          ),
          ItemProductCard(
            produk: ProdukModel(
              id: 2,
              kodeproduk: 'A002',
              namaproduk: 'Mesin Cuci',
              hargaproduk: 3500000
            ),
            handleNavigateToProdukDetail: (targetProduct) => {
              handleNavigateToProdukDetail(targetProduct)
            },
          ),
          ItemProductCard(
            produk: ProdukModel(
              id: 3,
              kodeproduk: 'A003',
              namaproduk: 'Iphone 5',
              hargaproduk: 1500000
            ),
            handleNavigateToProdukDetail: (targetProduct) => {
              handleNavigateToProdukDetail(targetProduct)
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          handleNavigateToProdukForm(null)
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  handleNavigateToProdukForm(ProdukModel? targetProduk) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ProductForm(product: targetProduk))
    );
  }

  handleNavigateToProdukDetail(ProdukModel targetProduk) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ProductDetail(produk: targetProduk))
    );
  }
}
