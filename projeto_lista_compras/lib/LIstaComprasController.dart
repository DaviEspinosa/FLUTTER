// importando
import 'package:flutter/material.dart';
import 'package:projeto_lista_compras/ListaComprasModel.dart';

class ListaComprasController extends ChangeNotifier{

  //Lista Compras
  List<ListaComprasController> _compras = [];

  //Getter para percorrer a lista
  List<ListaComprasController> get compras => _compras;

  //CRUD

  //Adicionar Lista Compras
  void adicionarCompras(String descricao, int quantidade){
    _compras.add(ListaComprasModel(descricao, quantidade, false) as ListaComprasController);//construtor da lista de compras

    notifyListeners();
  }

  void excluirCompras(int indice){
    if(indice >= 0 && indice < _compras.length){
      _compras.removeAt(indice);

      notifyListeners();
    }
  }

  void atualizarCompras(String descricao, int qunatidade, int indice){
    }


  }
