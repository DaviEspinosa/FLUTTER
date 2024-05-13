class Livro {
  
  //atributos
  final int id;
  final String titulo;
  final String autor;
  final String sinopse;
  final String capa;
  final String editora;
  final List<dynamic> categoria;
  final String isbn;
  final double preco;

//construtor
  Livro({
    required this.id,
    required this.titulo,
    required this.autor,
    required this.sinopse,
    required this.capa,
    required this.editora,
    required this.categoria,
    required this.isbn,
    required this.preco,
  });

  //métodos
  //joga para o json
  Map<String, dynamic> toJson(){
    return {
      'id':id,
      'titulo': titulo,
      'autor': autor,
      'sinopse':sinopse,
      'capa':capa,
      'editora':editora,
      'categoria':categoria,
      'isbn':isbn,
      'preco':preco
    };
  }
  //puxa do json
    factory Livro.fromJson(Map<String, dynamic> map) {
    return Livro(
        id: map['id'],
        titulo: map['titulo'],
        autor: map['autor'],
        sinopse: map['sinopse'],
        categoria: map['categoria'],
        capa: map['capa'],
        editora: map['editora'],
        isbn: 'isbn',
        preco: map['preco']);
  }

}