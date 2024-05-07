import 'package:projeto_json/Model/livros_model.dart';

class LivrosController {
  // Criando array para listar livros

  List<Livro> _listLivros = [];

  // get
  List<Livro> get listLivros {
    return _listLivros;
  }

  void addLivro(Livro livro){
    _listLivros.add(livro);
  }

  // Método JSON salvar
  
  // Método JSON carregar
}