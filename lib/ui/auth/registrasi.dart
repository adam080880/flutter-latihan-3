import 'package:flutter/material.dart';
import 'package:latihan_3/bloc/registrasi_bloc.dart';
import 'package:latihan_3/models/auth/registrasi.dart';
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
  bool _canSubmit = true;

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    _canSubmit = true;
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
              _renderTextToLogin(),
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
              onPressed: !_canSubmit ? null : () async {
                if (!_formKey.currentState!.validate()) {
                  return;
                }

                setState(() {
                  _canSubmit = false;
                });

                try {
                  String nama = _nameController.text;
                  String email = _emailController.text;
                  String password = _passwordController.text;
                  // run here
                  RegistrasiModel registrasiResponse = await RegistrasiBloc.registrasi(email: email, nama: nama, password: password);

                  if (registrasiResponse.status == false) {
                    throw Exception(registrasiResponse.message);
                  }

                  if (!mounted) return;

                  // if success
                  handleNavigateToLogin();

                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.green,
                    content: Text("Berhasil registrasi"),
                    showCloseIcon: true,
                    closeIconColor: Colors.white,
                  ));
                } catch (err) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                    content: Text(err.toString()),
                    showCloseIcon: true,
                    closeIconColor: Colors.white,
                  ));
                } finally {
                  setState(() {
                    _canSubmit = true;
                  });
                }
              },
              child: const Text('Registrasi'),
            )
          )
        ],
      )
    );
  }

  _renderTextToLogin() {
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
