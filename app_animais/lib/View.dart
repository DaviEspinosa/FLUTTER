import 'package:flutter/material.dart';

class TelaListaAnimais extends StatelessWidget {

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Barra superior do aplicativo
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(8, 118, 130, 1),
          title: Text("Animais"),
          titleTextStyle: TextStyle(color: Color.fromRGBO(7, 177, 78, 1))),

      body: Column(
        children: [
          Padding(padding: const EdgeInsets.all(8.0)
          child: TextField(
            // controller: _controller,
            decoration: InputDecoration(

            ),
          )),
        ],
      ),
    );
  }
}

class TelaAnimalDetalhe {}
