import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lista_online/tarefa_controller.dart';
import 'package:lista_online/tarefas_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TarefasController(),
      child: MaterialApp(
        title: 'Lista de Tarefas',
        home: TarefasView(),
      ),
    );
  }
}
