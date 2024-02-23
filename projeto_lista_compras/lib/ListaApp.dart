import 'package:projeto_lista_compras/ListaComprasModel.dart';
import 'package:projeto_lista_compras/ListaComprasView.dart';
import 'package:projeto_lista_compras/ListaComprasController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ListaTarefasApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      //Definindo a tela inicial como a LIstaTarefasScreen e utilizado o Provider
      home: ChangeNotifierProvider(
        create: (context)=> ListaComprasModel(),
        child: ListaComprasView(),
      ),
    );
  }
}