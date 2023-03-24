import 'package:flutter/material.dart';
import 'package:latihan_3/formatters/auto_upper_case.dart';
import 'package:latihan_3/ui/product_detail.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({Key? key}) : super(key: key);

  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _productCodeController = TextEditingController();
  final _productNameController = TextEditingController();
  final _productPriceController = TextEditingController();
  final _productStockController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Form Produk')),
        body: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Column(children: [
              _renderTextBoxProductCode(),
              _renderTextBoxProductName(),
              _renderTextBoxProductPrice(),
              _renderTextBoxProductStock(),
              _renderSaveButton()
            ])));
  }

  _renderTextBoxProductCode() {
    return TextField(
        decoration: const InputDecoration(
            hintText: 'Ex: DDKBBK01', labelText: 'Kode Produk'),
        controller: _productCodeController,
        inputFormatters: [AutoUpperCase()]);
  }

  _renderTextBoxProductName() {
    return TextField(
        decoration: const InputDecoration(
            hintText: 'Ex: Dedek bebek', labelText: 'Nama Produk'),
        controller: _productNameController);
  }

  _renderTextBoxProductPrice() {
    return TextField(
        decoration: const InputDecoration(
            hintText: 'Ex: 5000', labelText: 'Harga Produk'),
        keyboardType: TextInputType.number,
        controller: _productPriceController);
  }

  _renderTextBoxProductStock() {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Ex: 99', labelText: 'Stok Produk'),
      keyboardType: TextInputType.number,
      controller: _productStockController,
    );
  }

  _renderSaveButton() {
    return ElevatedButton(
        onPressed: _handleSaveButton, child: const Text('Simpan'));
  }

  _handleSaveButton() {
    if (_productCodeController.text.isEmpty ||
        _productNameController.text.isEmpty ||
        _productPriceController.text.isEmpty ||
        _productStockController.text.isEmpty) {
      AlertDialog alert = AlertDialog(
          title: const Text('Input tidak valid'),
          content: const Text('Semuanya wajib diisi'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'))
          ]);

      showDialog(context: context, builder: (BuildContext context) => alert);

      return;
    }

    String productCode = _productCodeController.text;
    String productName = _productNameController.text;
    int productPrice = int.parse(_productPriceController.text);
    int productStock = int.parse(_productStockController.text);

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ProductDetail(
            productCode: productCode,
            productName: productName,
            productPrice: productPrice,
            productStock: productStock,)));
  }
}