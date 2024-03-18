import 'package:flutter/material.dart';


void main() {
  runApp(TabbarExample());
}


class TabbarExample extends StatefulWidget {
  const TabbarExample({Key? key}) : super(key: key);

  @override
  State<TabbarExample> createState() => _TabbarExampleState();
}

class _TabbarExampleState extends State<TabbarExample> {


  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
        appBar: AppBar(
          title: const Text("Exercicio TabBar"),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.person),
                text: "Botão mudança de cor",
              ),
              Tab(
                icon: Icon(Icons.food_bank_rounded),
                text: "Produtos",
              ),
              Tab(
                icon: Icon(Icons.settings),
                text: "Configurações",
              )
            ],
          ),
        ),

        body: const TabBarView(
          // Adicione um DefaultTabController.length ao seu TabBarView
          children: <Widget>[
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: _buttonColor),
                onPressed: _changeButtonColor,
                 child: Text("Clique para mudança de cor"),
            ),
            ),
            Center(
              child: Text("Produtos"),
            ),
            Center(
              child: Text("Configurações"),
            ),
          ],
        ),
      ),
      ),
      
    );
  }
}
