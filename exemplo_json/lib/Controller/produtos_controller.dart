import 'dart:convert';

import 'package:exemplo_json/Model/produtos_model.dart';
import 'package:flutter/services.dart';

class ProdutosController {
  //atributos
  List<Produto> produtos = [];

  //
  Future<List<Produto>> loadProdutos() async {
    //carregando os dados do arquivo
    final data = await rootBundle.loadString('assets/produtos.json');
    // Decodifica o conteúdo JSON em uma lista dinâmica
    final jsonList = json.decode(data) as List<dynamic>;
    produtos.clear();
    // Converte os objetos JSON em instâncias de Produto e adiciona à lista de produtos
    produtos.addAll(jsonList.map((e) => Produto.fromJson(e)));
    return produtos;
  }
}
