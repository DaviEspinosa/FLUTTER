// ignore_for_file: prefer_const_constructors, unnecessary_new, sized_box_for_whitespace, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:projeto_persistencia_dados/LoginView.dart';


class CadastroView extends StatelessWidget  {
  @override
  Widget build(BuildContext context){

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(24, 111, 182, 1),
          titleTextStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
          title: Text("Cadastro"),
        ),
        body: Center(
    child: Container(
            height: 400,
            child: Column(
              children: [
                Container(
                  width: 350.0,
                  child: Column(
                    children: [

                      TextField(
                        decoration: InputDecoration(
                          icon: new Icon(Icons.person_4_outlined),
                          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          label: Text("Name"),
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                        ),
                      ),

                      SizedBox(height: 20,),

                      TextField(
                        decoration: InputDecoration(
                          icon: new Icon(Icons.email),
                          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          label: Text("E-mail"),
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                        ),
                      ),

                      SizedBox(height: 20,),      

                      TextField(
                        decoration: InputDecoration(
                          icon: new Icon(Icons.assignment_ind),
                          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          label: Text("CPF"),
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                        ),
                      ),

                      SizedBox(height: 20,),

                      TextField(
                        decoration: InputDecoration(
                          icon: new Icon(Icons.lock),
                          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          label: Text("Password"),
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                        ),
                      ),

                      SizedBox(height: 20,),

                      TextField(
                        decoration: InputDecoration(
                          icon: new Icon(Icons.lock_person),
                          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          label: Text("Confirm Password"),
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                        ),
                      ),

                      SizedBox(height: 20,),

                      ElevatedButton(
                        onPressed: (){
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginView()));
                        }, 
                        child: Text("Enviar"), 
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal:60 , vertical: 20),
                          backgroundColor: Color.fromRGBO(255, 255, 255, 1),   
                        ),
                      )
                    ],
                  ),
                )
              ],

            ),
          ),
        ),
      );
  }
}