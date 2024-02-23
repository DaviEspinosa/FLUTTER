//importando
import 'dart:js_interop';
import 'package:flutter/material.dart';
import 'package:app_list_1/TarefasModel.dart';

class TarefasController extends ChangeNotifier{

//Lista de Tarefas
  List<Tarefa> _tarefas = [];
  //Getter para acessar a lista
  List<Tarefa> get tarefas => _tarefas;

  //CRUD

  //Adicionar Tarefas
  void adicionarTarefa(String descricao){
    _tarefas.add(Tarefa(descricao, false));//construtor do tarefas model
    notifyListeners();
  }

  //Marcar como cocluida
  void marcarConcluida(int indice){
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas[indice].concluida = true;
      //Notifica ou ouvintes sobre a mudança de estado
      notifyListeners();
    }
  }

  void excluirTarefa(int indice){
    if(indice >= 0 && indice < _tarefas.length){
      _tarefas.removeAt(indice);
      //Notifica ou ouvintes sobre a mudança de estado
      notifyListeners();
    }
  }
}