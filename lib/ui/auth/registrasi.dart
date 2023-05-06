import 'package:flutter/material.dart';
import 'package:latihan_3/ui/product_list.dart';

class Registrasi extends StatefulWidget {
  final String? email;
  final String? password;

  const Registrasi({Key? key, this.email, this.password}) : super(key: key);

  @override
  _RegistrasiState createState() => _RegistrasiState();
}

class _RegistrasiState extends State<Registrasi> {
  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _renderTitle(),
              _renderName(),
              _renderEmail(),
              _renderPassword(),
              _renderButton(),
              _renderTextToRegister(),
            ]
          )
        )
      )
    );
  }

  _renderTitle() {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      alignment: Alignment.centerLeft,
      child: const Text('Registrasi', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
    );
  }

  _renderName() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        autocorrect: false,
        keyboardType: TextInputType.name,
        controller: _nameController,
        decoration: const InputDecoration(labelText: 'Nama', hintText: 'Ex: Muhamad Adam'),
        validator: (value) {
          //validasi harus diisi
          if (value!.isEmpty) {
            return 'Nama harus diisi';
          }
          return null;
        },
      )
    );
  }

  _renderEmail() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        controller: _emailController,
        decoration: const InputDecoration(labelText: 'Email', hintText: 'Ex: muhamadadam20@gmail.com'),
        validator: (value) {
          //validasi harus diisi
          if (value!.isEmpty) {
            return 'Email harus diisi';
          }
          return null;
        },
      )
    );
  }

  _renderPassword() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        autocorrect: false,
        keyboardType: TextInputType.visiblePassword,
        controller: _passwordController,
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Ex: *******',
          suffixIcon: IconButton(
          icon: Icon(
            _passwordVisible
              ? Icons.visibility_off
              : Icons.visibility,
            ),
            onPressed: () => {
              setState(() {
                  _passwordVisible = !_passwordVisible;
              })
            },
          ),
        ),
        obscureText: !_passwordVisible,
        validator: (value) {
          //validasi harus diisi
          if (value!.isEmpty) {
            return 'Password harus diisi';
          }
          return null;
        },
      )
    );
  }

  _renderButton() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              child: const Text('Registrasi'),
              onPressed: () => {
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const ProductList())
                  )
                }
              },
            )
          )
        ],
      )
    );
  }

  _renderTextToRegister() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Sudah punya akun?'),
        TextButton(
          onPressed: handleNavigateToLogin,
          child: const Text('Klik di sini'),
        )
      ],
    );
  }

  handleNavigateToLogin() {
    Navigator.pop(context);
  }
}
