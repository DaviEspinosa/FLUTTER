// ignore_for_file: prefer_is_not_empty
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:projeto_lista_compras/listaComprasModel.dart';

class ListaComprasController extends ChangeNotifier {
  BuildContext context;

  ListaComprasController(this.context);

  List<Compras> _compras = [];

  List<Compras> get compras => _compras;

  // método CRUD
  void adicionarCompra(String descricao) {
    // após remover espaços em branco, verifica se está vazio
    if (descricao.trim().isNotEmpty) {
      _compras.add(Compras(descricao.trim(), false));
      notifyListeners();
    } else {
      _aviso(context);
    }
  }

  void marcarComoConcluida(int indice) {
    if (indice >= 0 && indice < _compras.length) {
      _compras[indice].concluida = !_compras[indice].concluida;
      notifyListeners();
    }
  }

  void excluirCompra(int indice) {
    if (indice >= 0 && indice < _compras.length) {
      _compras.removeAt(indice);
      notifyListeners();
    }
  }

  void atualizarCompra(int indice, String descricao){
    if (indice >= 0 && indice < _compras.length) {
      _compras.add(Compras(descricao.trim(), _compras[indice].concluida));
    }
  }

  void _aviso(BuildContext context) { // Criar um método para abrir uma caixa de diálogop
    Widget okButton = TextButton( // Cria o botão de OK
    
      child:Text("OK"), 
      onPressed: () {
        Navigator.of(context)
            .pop(); // Fechar o AlertDialog ao pressionar o botão "OK"
      },
    );


    AlertDialog aviso = AlertDialog(
      content: Text("Escreva algo, por favor!!!"),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return aviso;
      },
    );
  }
}
