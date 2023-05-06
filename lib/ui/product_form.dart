import 'package:flutter/material.dart';
import 'package:latihan_3/formatters/auto_upper_case.dart';
import 'package:latihan_3/models/data/produk.dart';
class ProductForm extends StatefulWidget {
  final ProdukModel? product;
  const ProductForm({Key? key, this.product}) : super(key: key);

  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();
  final _productCodeController = TextEditingController();
  final _productNameController = TextEditingController();
  final _productPriceController = TextEditingController();

  @override
  void initState() {
    super.initState();

    print(widget.product);
    print('widget.product');

    _productCodeController.text = widget.product?.kodeproduk ?? '';
    _productNameController.text = widget.product?.namaproduk ?? '';
    _productPriceController.text = (widget.product?.hargaproduk?.toString() ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: const Text('Form Produk')),
    body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _renderTextBoxProductCode(),
              _renderTextBoxProductName(),
              _renderTextBoxProductPrice(),
              _renderSaveButton(context),
            ]
          )
        )
      ),
    );
  }

  _renderTextBoxProductCode() {
    return TextFormField(
        decoration: const InputDecoration(
            hintText: 'Ex: DDKBBK01', labelText: 'Kode Produk'),
        controller: _productCodeController,
        inputFormatters: [AutoUpperCase()]);
  }

  _renderTextBoxProductName() {
    return TextFormField(
        decoration: const InputDecoration(
            hintText: 'Ex: Dedek bebek', labelText: 'Nama Produk'),
        controller: _productNameController);
  }

  _renderTextBoxProductPrice() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        decoration: const InputDecoration(
            hintText: 'Ex: 5000', labelText: 'Harga Produk'),
        keyboardType: TextInputType.number,
        controller: _productPriceController,
      )
    );
  }

  _renderSaveButton(context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: _handleSaveButton(context),
            child: const Text('Simpan')
          )
        )
      ]
    );
  }

  _handleSaveButton(context) {
    return () {
      if (_formKey.currentState!.validate()) {
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

      ProdukModel newProduct = ProdukModel();
      newProduct.kodeproduk = _productCodeController.text;
      newProduct.namaproduk = _productNameController.text;
      newProduct.hargaproduk = int.parse(_productPriceController.text);

      Navigator.of(context).pop();
    };
  }
}
