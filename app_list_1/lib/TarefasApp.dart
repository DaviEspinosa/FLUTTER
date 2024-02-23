import 'package:app_list_1/TarefasModel.dart';
import 'package:app_list_1/TarefasView.dart';
import 'package:app_list_1/TarefasController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ListaTarefasApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      //Definindo a tela inicial como a LIstaTarefasScreen e utilizado o Provider
      home: ChangeNotifierProvider(
        create: (context)=> Tarefa(),
        child: ListaTarefasScreen(),
      ),
    );
  }
}