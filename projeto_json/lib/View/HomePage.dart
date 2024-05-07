import 'package:flutter/material.dart';
import 'package:projeto_json/View/CadastroLivrosPage.dart';
import 'package:projeto_json/View/ListarLivrosPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IBEL", style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromRGBO(20, 41, 82, 0.996),
      ),
      body:Padding(padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [

              SizedBox(height: 20,),

              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(65, 89, 136, 0.988)),
                onPressed: (){
                  Navigator.pushNamed(context, '/cadastro');
                  // if (_formkey.currentState!.validate()) {
                    
                  // }
                },
                child: Text("Cadastrar Livros", style: TextStyle(color: Colors.white),)
              ),

              SizedBox(height: 20,),

              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(65, 89, 136, 0.988)),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ListarLivros()));
                },
                child: Text("Biblioteca", style: TextStyle(color: Colors.white),),
              )
            ],
          ),
        ),
       ),
    );
  }
}