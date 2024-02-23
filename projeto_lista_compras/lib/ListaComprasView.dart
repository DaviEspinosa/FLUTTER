import 'package:projeto_lista_compras/ListaComprasModel.dart';
import 'package:projeto_lista_compras/ListaComprasController.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

class ListaComprasView extends StatelessWidget{
  final TextEditingController _controller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    title: Text('Lista de Compras'),
  ),
  // Corpo principal do aplicativo
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Nova Compra',
                suffixIcon: IconButton(
                  onPressed: () {
                    Provider.of<ListaComprasController>(context, listen: false)
                    .adicionarCompras(_controller.text);
                    _controller.clear();
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),

     // Lista de tarefas usando um Consumer do Provider para atualização automática
          Expanded(
            child: Consumer<ListaComprasModel>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.compras.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      // Exibição do texto da tarefa
                      title: Text(model.[index].descricao),
                     
                      // Exclui a tarefa ao manter pressionado
                      onLongPress: () {
                        // Chamando o método excluirTarefa do Provider para atualizar o estado
                        model.excluirCompras(index);
                      },
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
  