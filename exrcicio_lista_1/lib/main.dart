import 'package:exrcicio_lista_1/App.dart';
import 'package:exrcicio_lista_1/View.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(){
  runApp(View());
}

class View extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      appBar:AppBar(
        title: Text('List View'),
        titleTextStyle: TextStyle(color: Color.fromRGBO(255,255,255,1)),
        backgroundColor: Color.fromRGBO(15, 75, 42, 1),
      ),

      body: Center(
        child: Container(
          child: Column(
            children: [
              Container(
                width: 450.0,
                height: MediaQuery.of(context).size.height*.9,
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
                          enabledBorder: const OutlineInputBorder(
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
                          enabledBorder: const OutlineInputBorder(
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
                            enabledBorder: const OutlineInputBorder(
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
    ),
  );
} 
}



