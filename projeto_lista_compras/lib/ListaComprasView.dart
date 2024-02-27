
import 'dart:js_interop';

import 'package:projeto_lista_compras/ListaComprasModel.dart';
import 'package:projeto_lista_compras/ListaComprasController.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

class ListaComprasView extends StatelessWidget{
  final TextEditingController _controller = TextEditingController();
    //Lista Compras
  List<ListaComprasModel> _compras = [];

  //Getter para percorrer a lista
  List<ListaComprasModel> get compras => _compras;
  
  @override
  Widget build(BuildContext context) {
  ListaComprasController classControl = ListaComprasController();
return Scaffold(
  // Corpo principal do aplicativo
      body: Padding(
   padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Item'),
            ),
            ElevatedButton(onPressed: () => classControl.adicionarCompras(_controller.text, _compras.length), child: Text('Adicionar'))
          ],
        ),
      ),
);
  

}


}