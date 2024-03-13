// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:js_interop';

import 'package:exrcicio_lista_1/App.dart';
import 'package:exrcicio_lista_1/View.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(){
  runApp(exercicio());
}

class exercicio extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    home: DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar:AppBar(
          title: Text('List View'),
          titleTextStyle: TextStyle(color: Color.fromRGBO(255,255,255,1)),
          backgroundColor: Color.fromRGBO(81, 15, 147, 1),
          bottom: 
          TabBar(
            
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.cloud, color: Color.fromRGBO(255,255 ,255 , 1)),
              ),
              Tab(
                icon: Icon(Icons.umbrella, color: Color.fromRGBO(255,255 ,255 , 1)),
              ),  
              Tab(
                icon: Icon(Icons.car_crash, color: Color.fromRGBO(255,255 ,255 , 1)),
              ),
              Tab(
                icon: Icon(Icons.vaccines, color: Color.fromRGBO(255,255 ,255 , 1)),
              ),
            ]
          ),
        ),

      drawer: Drawer(
        backgroundColor: Color.fromRGBO(183, 183, 183, 1),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  child: Text('Pe'),
                ),
                accountName: Text('Pedrosa') , 
                accountEmail: Text('davipedrosa@gmail.com')
              ), 
            ]
          ),
      ),

      body: Center(
        child: Container(
          child: Column(
            children: [
              Container(
                width: 450.0,
                height: MediaQuery.of(context).size.height*.6,
                child: 
                  Column(
                    children: [
                      SizedBox(height: 60,),
                      Text('Digite sua Mensagem'),
                      SizedBox(height: 50,),
                      
                      TextField(
                        decoration: InputDecoration(
                          icon: new Icon(Icons.email),
                          labelText: 'E-mail',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)) )
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextField(
                        decoration: InputDecoration(
                          // prefixIcon:  Icon(Icons.lock),
                          icon: new Icon(Icons.lock),
                          labelText: 'Senha',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)) )
                        ),
                      ),
                      SizedBox(height: 20,),
                      
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Digite sua mensagem...',
                            icon: new Icon(Icons.message),
                            labelText: 'Mensagem',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)) )
                          ),
                          maxLines: null,
                        ),
                    ],
                  )
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Produtos'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrinho'
          ),
        ],
      ),
    ),
    ),
  );
} 
}

//exercicio 1
//exercicio 3
//exercicio 4 (formulario de contato - não acabado)
//exercicio 7



