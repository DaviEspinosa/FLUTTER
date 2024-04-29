class Produtos {
  //atributos
  final String nome;
  final String preco;
  final String categoria;
  //construtor
  const Produtos({
    required this.nome,
    required this.preco,
    required this.categoria
  });
  //métodos
  Map<String, dynamic> toJson(){
    return{
        'nome':nome,
        'preco':preco,
        'categoria':categoria,
    };
  }
  //fabrica
  factory Produtos.fromJson(Map<String, dynamic> json){
    return Produtos(
     nome: json['nome'],
     preco: json['preco'],
     categoria: json['categoria']
    );
  }

}
