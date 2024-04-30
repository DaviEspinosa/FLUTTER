import 'package:flutter/material.dart';

class CadastroLivrosPage extends StatefulWidget {
  const CadastroLivrosPage({super.key});

  @override
  State<CadastroLivrosPage> createState() => _CadsatroLivrosPageState();
}

class _CadsatroLivrosPageState extends State<CadastroLivrosPage> {

  //controlles para pegar o texto das inputs
  final TextEditingController _controllerLivros =  TextEditingController();
  final TextEditingController _controllerAutor = TextEditingController();
  final TextEditingController _controllerEditora =  TextEditingController();
  final TextEditingController _controllerISBN =  TextEditingController();
  final TextEditingController _controllerValor =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar Livro"),
      ),
      body: Center(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Titulo do Livro",
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Autor do Livro",
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Sinopse do Livro",
                ),
              ),
              // TextFormField(
              //   decoration: InputDecoration(
              //     labelText: "Ano do Livro",
              //   ),
              // ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "ISBN do Livro",
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Valor do Livro",
                ),
              ),
              // TextFormField(
              //   decoration: InputDecoration(
              //     labelText: "Quantidade do Livro",
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}