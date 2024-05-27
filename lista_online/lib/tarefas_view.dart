import 'package:flutter/material.dart';
import 'package:lista_online/tarefa_controller.dart';
import 'package:provider/provider.dart';

class TarefasView extends StatefulWidget {
  const TarefasView({Key? key}) : super(key: key);

  @override
  State<TarefasView> createState() => _TarefasViewState();
}

class _TarefasViewState extends State<TarefasView> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Nova Tarefa',
                suffixIcon: IconButton(
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      Provider.of<TarefasController>(context, listen: false)
                          .adicionarTarefas(_controller.text);
                      _controller.clear();
                    }
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),
          Expanded(
            child: Consumer<TarefasController>(
              builder: (context, tarefasController, child) {
                return ListView.builder(
                  itemCount: tarefasController.tarefas.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(tarefasController.tarefas[index] as String),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
