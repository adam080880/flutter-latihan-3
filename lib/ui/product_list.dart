import 'package:flutter/material.dart';
import 'package:latihan_3/models/product.dart';
import 'package:latihan_3/ui/product_form.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  _handlePressAdd (ProductModel productModel) {
    return () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<ProductModel>(
          create: (context) => ProductModel(),
          builder: (context, child) => ProductForm(productModel: productModel),
        )
      ));
    };
  }

  @override
  Widget build(BuildContext buildContext) {
    return ChangeNotifierProvider(
      create: (context) => ProductModel(),
      child: Consumer<ProductModel>(
        builder: (context, products, child) {
          List<Product> productList = products.items;
          return Scaffold(
            appBar: AppBar(title: const Text('Daftar Produk')),
            body: ListView.builder(
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text('(${productList[index].productCode}) ${productList[index].productName}'),
                  subtitle: Text('Harga: ${productList[index].productPrice}) Stok: ${productList[index].productStock}'),
                )
              );
            }),
            floatingActionButton: FloatingActionButton(
              onPressed: _handlePressAdd(products),
              child: const Icon(Icons.add),
            ),
          );
        },
      )
    );
  }
}
