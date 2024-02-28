import 'package:projeto_lista_compras/listaComprasController.dart';
import 'package:flutter/material.dart';
import 'package:projeto_lista_compras/listaView.dart';
import 'package:provider/provider.dart';

class ListarComprasApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Definindo a tela inicial como a ListaTarefasScreen 
      home: ChangeNotifierProvider(
        create: (context) => ListaComprasController(context),
        child: ListaComprasScreen(),
      )
    );
  }
}