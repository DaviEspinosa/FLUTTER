import 'package:exemplo_firebase/service/auth_service.dart';
import 'package:flutter/material.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<RegistroScreen> createState() => _RggistroScreenState();
}

class _RggistroScreenState extends State<RegistroScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AuthService _authService = AuthService();

@override
  Widget build(BuildContext context) {
    return Scaffold(
      // tela de registro com confirmação de senha
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              //campos do form
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                  ),
                  validator: (value) {}),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
              validator: (value){}),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirmar Senha',
                ),)
            ])),
        ),),

    );
  }
}
