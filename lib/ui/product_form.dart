import 'package:flutter/material.dart';
import 'package:latihan_3/bloc/produk_bloc.dart';
import 'package:latihan_3/formatters/auto_upper_case.dart';
import 'package:latihan_3/models/data/produk.dart';
class ProductForm extends StatefulWidget {
  final ProdukModel? product;
  final dynamic loadProducts;
  const ProductForm({Key? key, this.product, this.loadProducts}) : super(key: key);

  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;
  final _productCodeController = TextEditingController();
  final _productNameController = TextEditingController();
  final _productCategoryGroupController = TextEditingController();
  final _productPriceController = TextEditingController();
  final _productPriceBuyController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _productCodeController.text = widget.product?.kodeproduk ?? '';
    _productNameController.text = widget.product?.namaproduk ?? '';
    _productCategoryGroupController.text = widget.product?.kategorigroupproduk ?? '';
    _productPriceController.text = (widget.product?.hargaproduk?.toString() ?? '');
    _productPriceBuyController.text = (widget.product?.hargabeliproduk?.toString() ?? '');

    _loading = false;
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
              _renderTextBoxProductCategoryGroup(),
              _renderTextBoxProductPrice(),
              _renderTextBoxProductBuyPrice(),
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

  _renderTextBoxProductCategoryGroup() {
    return TextFormField(
        decoration: const InputDecoration(
            hintText: 'Ex: Dedek', labelText: 'Kategori Produk'),
        controller: _productCategoryGroupController);
  }

  _renderTextBoxProductPrice() {
    return TextFormField(
      decoration: const InputDecoration(
          hintText: 'Ex: 5000', labelText: 'Harga Produk'),
      keyboardType: TextInputType.number,
      controller: _productPriceController,
    );
  }

  _renderTextBoxProductBuyPrice() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        decoration: const InputDecoration(
            hintText: 'Ex: 5000', labelText: 'Harga Beli Produk'),
        keyboardType: TextInputType.number,
        controller: _productPriceBuyController,
      )
    );
  }

  _renderSaveButton(context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: _loading ? null : _handleSaveButton(context),
            child: const Text('Simpan'),
          )
        )
      ]
    );
  }

  _handleSaveButton(context) {
    return () async {
      if (!_formKey.currentState!.validate()) {
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

      setState(() {
        _loading = true;
      });

      ProdukModel newProduct = ProdukModel();
      newProduct.id = widget.product?.id; // kalau proses tambah produk, nilai ini null
      newProduct.kodeproduk = _productCodeController.text;
      newProduct.kategorigroupproduk = _productCategoryGroupController.text;
      newProduct.namaproduk = _productNameController.text;
      newProduct.hargaproduk = int.parse(_productPriceController.text);
      newProduct.hargabeliproduk = int.parse(_productPriceController.text);

      try {
        if (newProduct.id == null) {
          await ProdukBloc.addProduk(produk: newProduct);
        } else {
          await ProdukBloc.updateProduk(produk: newProduct);
        }

        await widget.loadProducts();

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text("Berhasil ${newProduct.id != null ? 'edit' : 'tambah'} produk"),
          showCloseIcon: true,
          closeIconColor: Colors.white,
        ));

        int count = 0;
        Navigator.of(context).popUntil((_) => count++ >= (newProduct.id == null ? 1 : 2));
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(error.toString()),
          showCloseIcon: true,
          closeIconColor: Colors.white,
        ));
      } finally {
        setState(() {
          _loading = false;
        });
      }
    };
  }
}
