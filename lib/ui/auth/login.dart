import 'package:flutter/material.dart';
import 'package:latihan_3/ui/auth/registrasi.dart';
import 'package:latihan_3/ui/product_list.dart';

class Login extends StatefulWidget {
  final String? email;
  final String? password;

  const Login({Key? key, this.email, this.password}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
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
      child: const Text('Login', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
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
      ),
    );
  }

  _renderButton() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () => {
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const ProductList())
                  )
                }
              },
              child: const Text('Login'),
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
        const Text('Belum punya akun?'),
        TextButton(
          onPressed: handleNavigateToRegister,
          child: const Text('Klik di sini'),
        )
      ],
    );
  }

  handleNavigateToRegister() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const Registrasi())
    );
  }
}
