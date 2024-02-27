import 'package:flutter/material.dart';
import 'package:projeto_lista_compras/ListaComprasController.dart';
import 'package:provider/provider.dart';
import 'package:projeto_lista_compras/ListaComprasView.dart'; // Supondo que esta seja a classe que você criou para a interface de usuário

void main() {
  runApp(ListaTarefasApp());
}

class ListaTarefasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ListaComprasController(),
      child: MaterialApp(
        title: 'Lista de Compras',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ListaComprasView(), // Defina aqui a tela inicial
      ),
    );
  }
}
