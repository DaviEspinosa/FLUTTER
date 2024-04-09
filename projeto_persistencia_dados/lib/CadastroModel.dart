import 'package:flutter/material.dart';

class CadastroModel {
  // int? id; //valor desta variavel pode ser nulo
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

  Map<String, dynamic> toMap() {
    return {
      'name' : name,
      'email' : email,
      'cpf' : cpf,
      'senha' : senha,
      'confirmaSenha' : confirmaSenha
    };
  }

  factory CadastroModel.fromMap(Map<String, dynamic> map) {
    return CadastroModel(
      name: map['name'],
      email: map['email'],
      cpf: map['cpf'],
      senha: map['senha'], 
      confirmaSenha: map['confirmaSenha'],
    );
  }

}