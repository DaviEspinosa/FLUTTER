class CadastroModel {
  // int? id; //valor desta variavel pode ser nulo
  String senha;
  String email;
  String name;
  String cpf;

  CadastroModel({

    required this.name,
    required this.email,
    required this.cpf,
    required this.senha,
  });

  Map<String, dynamic> toMap() {
    return {
      'name' : name,
      'email' : email,
      'cpf' : cpf,
      'senha' : senha,
    };
  }

  factory CadastroModel.fromMap(Map<String, dynamic> map) {
    return CadastroModel(
      name: map['name'],
      email: map['email'],
      cpf: map['cpf'],
      senha: map['senha'], 
    );
  }

}