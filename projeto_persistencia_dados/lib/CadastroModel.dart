class CadastroModel {
  String senha;
  String email;
  String name;
  String confirmaSenha;
  int cpf;

  CadastroModel({
    required this.name,
    required this.email,
    required this.cpf,
    required this.senha,
    required this.confirmaSenha,
  });

}