import 'package:flutter/material.dart';
import 'package:lista_online/tarefas_model.dart';

class TarefasController extends ChangeNotifier {
  List<TarefasModel> _tarefas = [];

  List<TarefasModel> get tarefas => _tarefas;

  //métodos CRUD
  void adicionarTarefas(String descricao) {
    _tarefas.add(TarefasModel(descricao, false));
    print('okokkko'); //construtor do tarefas model
    notifyListeners();
  }

  void excluirTarefas(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas.removeAt(indice);
      notifyListeners();
    }
  }

  void marcarConcluida(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas[indice].concluida = true;
      notifyListeners();
    }
  }
}
