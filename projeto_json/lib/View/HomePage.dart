import 'package:flutter/material.dart';

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
        title: Text("Tela Inicial"),
      ),
      body:Padding(padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [

              SizedBox(height: 20,),

              ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CadastroPage()));
                },
                child: Text("Cadastrar")
                ),

              SizedBox(height: 20,),

              ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ListarProdutosPage()));
                },
                child: Text("Produtos")
                )
            ],
          ),
        ),
       ),
    );
  }
}