import 'package:flutter/material.dart';
import 'package:sa3_projeto/Controller/BancoDados.dart';
import 'package:sa3_projeto/Model/Usuario.dart';
import 'package:sa3_projeto/View/LoginView.dart';

class PaginaCadastro extends StatefulWidget {
  const PaginaCadastro({super.key});

  @override
  State<PaginaCadastro> createState() => _PaginaCadastroState();
}

class _PaginaCadastroState extends State<PaginaCadastro> {

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(24, 111, 182, 1),
          titleTextStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
          title: Text("Cadastro"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    children: [

                      SizedBox(height: 20,),

                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage('./img/icone.webp'),
                      ),

                      SizedBox(height: 20,),

                      TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          prefixIcon: new Icon(Icons.person_4_outlined),
                          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          label: Text("Name"),
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                        ),
                      ),

                      SizedBox(height: 20,),

                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          prefixIcon: new Icon(Icons.email),
                          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          label: Text("E-mail"),
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                        ),
                      ),

                      SizedBox(height: 20,),      

                      TextField(
                        controller: _senhaController,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: new Icon(Icons.lock),
                          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          label: Text("Password"),
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                        ),
                      ),

                      SizedBox(height: 20,),

                    ElevatedButton(
                      onPressed: () async {

                        if (_usernameController.text.isEmpty ||
                            _emailController.text.isEmpty||
                            _senhaController.text.isEmpty
                        ) {
                              ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Preencha todos os Campos')),); 
                        }
                        else{
                            // Cadastro bem-sucedido
                            ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Cadastro feito com sucesso')),);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PaginaLogin()));
                        }

                        Usuario model = Usuario(
                          name: _usernameController.text,
                          email: _emailController.text,
                          senha: _senhaController.text              
                        );
                        
                        
                        await BancoDados().create(model);

                      },
                      child: Text("Enviar", style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1))),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                        backgroundColor: Color.fromRGBO(24, 111, 182, 1),
                      ),
                    )
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
