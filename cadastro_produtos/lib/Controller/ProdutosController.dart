import 'dart:convert';
import 'dart:io';

import 'package:cadastro_produtos/Model/ProdutosModel.dart';
import "package:path_provider/path_provider.dart";
import "package:flutter/services.dart";

//Classe criada para operaçãoe gerenciamento dos JSONs (produtos no caso)

class ProdutoController {
  final List<Produto> _produtos = []; // Lista de produtos


  List<Produto> get produtos =>
      _produtos; // Getter para acessar a lista de produtos


  // Método para carregar produtos do arquivo JSON
  Future<void> loadProdutos() async {
    // Carrega o conteúdo do arquivo JSON da pasta assets
    final data = await rootBundle.loadString('assets/produtos.json');
    // Decodifica o conteúdo JSON em uma lista dinâmica
    final jsonList = json.decode(data) as List<dynamic>;
    _produtos.clear();
    // Converte os objetos JSON em instâncias de Produto e adiciona à lista de produtos
    _produtos.addAll(jsonList.map((e) => Produto.fromJson(e)));
  }


  // Método para salvar produtos no arquivo JSON
  Future<void> saveProdutos() async {
    // Obtém o diretório de documentos do aplicativo
    final appDocDir = await getApplicationDocumentsDirectory();
    // Caminho do arquivo produtos.json no diretório de documentos
    final filePath = '${appDocDir.path}/produtos.json';//appDocDir.path pasta interna do meu aplicativo
    // Converte os produtos em uma lista de JSON
    final jsonList = _produtos.map((produto) => produto.toJson()).toList();
    // Escreve a lista de JSON no arquivo produtos.json
    await File(filePath).writeAsString(json.encode(jsonList));
  }

  // Método para salvar os produtos no arquivo JSON(volta)
  Future<void> salvarProdutosNoArquivo() async {
    try {
      final jsonList = _produtos.map((produto) => produto.toJson()).toList();
      await File('assets/produtos.json').writeAsString(json.encode(jsonList));
      print('Produtos salvos com sucesso');
    } catch (e) {
      print('Erro ao salvar produtos no arquivo: $e');
    }
  }

  // Método para adicionar um novo produto à lista
  void adicionarProduto(Produto produto) {
    _produtos.add(produto);
  }

  //Método para remover um produto da lista
  void removerProduto(Produto produto){
    _produtos.remove(produto);
  }
}

//PATH - me deixa usar o armazenamneto interno da minha aplicação
//PATH_PROVIDER - utiliza métodos para acessar os dados interno da minha aplicação
