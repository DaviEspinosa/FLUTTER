import 'package:flutter/material.dart';
import 'package:projeto_json/View/CadastroLivrosPage.dart';
import 'package:projeto_json/View/Homepage.dart';
import 'package:projeto_json/View/ListarLivrosPage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Livraria Json",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown
      ),
      initialRoute: '/home',
      routes: {
        '/home':(context) => const HomePage(),
        '/cadastro':(context) => const CadastroLivrosPage(),
        '/lista':(context) => const ListarLivros()
      },
    );
  }
}