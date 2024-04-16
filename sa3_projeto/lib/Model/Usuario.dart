class Usuario {
  
  //atributos
  String name;
  String email;
  String senha;

  Usuario({
    required this.name,
    required this.email,
    required this.senha,
  });
  
    Map<String, dynamic> toMap() {
    return {
      'user_name' : name,
      'user_email' : email,
      'user_senha' : senha,
      };
    }
      factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      name: map['user_name'],
      email: map['user_email'],
      senha: map['user_senha'], 
    );
  }
  }