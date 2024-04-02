import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projeto_persistencia_dados/CadastroView.dart';

import 'package:projeto_persistencia_dados/LoginView.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/cadastro',
      routes: {
        '/cadastro': (context) => CadastroView(),
        '/login': (context) => LoginView(),
      },
    );
  }
}