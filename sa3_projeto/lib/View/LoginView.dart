import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sa3_projeto/Controller/BancoDados.dart';
import 'package:sa3_projeto/Model/Usuario.dart';
import 'package:sa3_projeto/View/CadastroView.dart';
import 'package:sa3_projeto/View/ListaView.dart';

class PaginaLogin extends StatefulWidget {
  const PaginaLogin({super.key});

  @override
  State<PaginaLogin> createState() => _PaginaLoginState();
}

class _PaginaLoginState extends State<PaginaLogin> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(24, 111, 182, 1),
          titleTextStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
          title: Text("Login"),
        ),
                body: Center(
          child: Container(
            height: 400,
            child: Column(
              children: [
                Container(
                  width: 350.0,
                  child: Column(
                    children: [

                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          prefixIcon: new Icon(Icons.person_4_outlined),
                          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          label: Text("E-mail"),
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
                        ),
                      ),

                      SizedBox(height: 20,),

                      TextFormField(
                        controller: _senhaController,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: new Icon(Icons.email),
                          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          label: Text("Password"),
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
                        ),
                      ),

                      SizedBox(height: 20,),  

                      ElevatedButton(
                        onPressed: () async {
                          //exibindo mensagem caso esteja vazio

                          String email = _emailController.text;
                          String senha = _senhaController.text;   

                          // Verificar se o usuário existe no banco de dados
                          bool usuarioExiste = await BancoDados().getUsuario(email, senha);

                          if (_emailController.text.isEmpty ||
                              _senhaController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar
                            (SnackBar(content: Text("Por favor, Preencha os Campos!")));
                          }
                           if (usuarioExiste) {
                            // Se o usuário existe, navegue para a HomePage
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ListaPage()));
                            }
                          else {
                            // Se o usuário não existe, exiba uma mensagem
                            ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Usuário não encontrado')));
                          }           
                        

                        },
                        child: Text("Entrar"), 
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal:60 , vertical: 20),
                          backgroundColor: Color.fromRGBO(255, 255, 255, 1),   
                        ),
                      ),

                      TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => PaginaCadastro()));},
                      child: Text("Ainda não tem conta?     Cadastre-se")),


                    ],
                  ),
                )
              ],

            ),
          ),
        ),
      );
  }
}