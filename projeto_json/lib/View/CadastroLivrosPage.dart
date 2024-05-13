import 'package:flutter/material.dart';
import 'package:projeto_json/Controller/livros_controller.dart';
import 'package:projeto_json/Model/livros_model.dart';

class CadastroLivrosPage extends StatefulWidget {
  const CadastroLivrosPage({super.key});

  @override
  State<CadastroLivrosPage> createState() => _CadsatroLivrosPageState();
}

class _CadsatroLivrosPageState extends State<CadastroLivrosPage> {

  //controlles para pegar o texto das inputs
  final TextEditingController _controllerLivros =  TextEditingController();
  final TextEditingController _controllerAutor = TextEditingController();
  final TextEditingController _controllerSinopse = TextEditingController();
  final TextEditingController _controllerCategoria = TextEditingController();
  final TextEditingController _controllerEditora =  TextEditingController();
  final TextEditingController _controllerISBN =  TextEditingController();
  final TextEditingController _controllerValor =  TextEditingController();
  
  LivrosController _controller = new LivrosController();

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
                controller: _controllerLivros,
                decoration: InputDecoration(
                  labelText: "Titulo do Livro",
                ),
                validator: (value){
                  if (value!.trim().isEmpty) {
                    return  "Titulo não pode ser vazio";
                  }
                  else{
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: _controllerAutor,
                decoration: InputDecoration(
                  labelText: "Autor do Livro",
                ),
                validator: (value){
                  if (value!.trim().isEmpty) {
                    return  "Autor não pode ser vazio";
                  }
                  else{
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: _controllerSinopse,
                decoration: InputDecoration(
                  labelText: "Sinopse do Livro",
                ),
                validator: (value){
                  if (value!.trim().isEmpty) {
                    return  "Autor não pode ser vazio";
                  }
                  else{
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: _controllerCategoria,
                decoration: InputDecoration(
                  labelText: "Categoria do Livro, separe por virgula",
                ),
                validator: (value){
                  if (value!.trim().isEmpty) {
                    return  "Categoria não pode ser vazio";
                  }
                  else{
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: _controllerEditora,
                decoration: InputDecoration(
                  labelText: "Editora do Livro",
                ),
                validator: (value){
                  if (value!.trim().isEmpty) {
                    return  "Editora não pode ser vazio";
                  }
                  else{
                    return null;
                  }
                },
              ),
              TextFormField(
                controller:_controllerISBN,
                decoration: InputDecoration(
                  labelText: "ISBN do Livro",
                ),
                validator: (value){
                  if (value!.trim().isEmpty) {
                    return  "ISBN não pode ser vazio";
                  }
                  else{
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: _controllerValor,
                decoration: InputDecoration(
                  labelText: "Valor do Livro",
                ),
                validator: (value){
                  if (value!.trim().isEmpty) {
                    return  "Valor não pode ser vazio";
                  }
                  else{
                    return null;
                  }
                },
              ),
            SizedBox(height: 20),
            
              ElevatedButton(
               style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(65, 89, 136, 0.988)),
               onPressed: (){

              }, child: Text("Cadastrar", style: TextStyle(color: Colors.white),),)
            ],
          ),
        ),
      ),
    );


  // Future<void> _tirarFoto()async{
  //   final image = await ImagePicker.pickImage(source: ImageSource.camera);
  //   if(image!= null){
  //     setState(() {
  //       _controllerFoto.text = image.path;
  //     });
  // }}

  }

  _cadastrar(){
    final livro = Livro(
    id: _controller.listLivros.length+1,
    titulo: _controllerLivros.text,
    autor: _controllerAutor.text,
    sinopse: _controllerSinopse.text,
    categoria: _controllerCategoria.text.split(","),
    editora: _controllerEditora.text,
    isbn: _controllerISBN.text,
    preco: double.parse(_controllerValor.text),
    capa: ''
    );
    _controller.addLivro(livro);
    return _cleanController();

  }

  void _cleanController(){
    _controllerLivros.clear();
    _controllerAutor.clear();
    _controllerSinopse.clear();
    _controllerCategoria.clear();
    _controllerEditora.clear();
    _controllerISBN.clear();
    _controllerValor.clear();
  }
}
