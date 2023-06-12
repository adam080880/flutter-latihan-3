import 'package:flutter/material.dart';
import 'package:latihan_3/bloc/produk_bloc.dart';
import 'package:latihan_3/models/data/produk.dart';
import 'package:latihan_3/ui/auth/login.dart';
import 'package:latihan_3/ui/product_detail.dart';
import 'package:latihan_3/ui/product_form.dart';
import 'package:latihan_3/widgets/ItemProdukCard.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  bool _loading = false;
  List<ProdukModel> _produks = [];

  @override
  initState() {
    super.initState();
    loadProducts();
  }

  loadProducts() async {
    setState(() {
      _loading = true;
    });

    List<ProdukModel> newProduks = await ProdukBloc.getProduks();

    setState(() {
      _loading = false;
      _produks = newProduks;
    });
  }

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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));
              },
            )
          ],
        ),
      ),
      body: _loading ? const Center(child: CircularProgressIndicator()) : ListView.builder(
        itemCount: _produks.length,
        itemBuilder: (context, index) => ItemProductCard(
          produk: _produks[index],
          handleNavigateToProdukDetail: (targetProduct) => {
            handleNavigateToProdukDetail(targetProduct)
          },
        ),
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
      MaterialPageRoute(builder: (context) => ProductForm(product: targetProduk, loadProducts: loadProducts))
    );
  }

  handleNavigateToProdukDetail(ProdukModel targetProduk) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ProductDetail(produk: targetProduk, loadProducts: loadProducts))
    );
  }
}
