import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  @override
    Widget build(BuildContext context){

        return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(24, 111, 182, 1),
          titleTextStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
          title: Text("Login"),
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
                          prefixIcon: new Icon(Icons.person_4_outlined),
                          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          label: Text("E-mail"),
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
                        ),
                      ),

                      SizedBox(height: 20,),

                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: new Icon(Icons.email),
                          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          label: Text("Password"),
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
                        ),
                      ),

                      SizedBox(height: 20,),      

                      ElevatedButton(
                        onPressed: (){},
                        child: Text("Entrar"), 
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
 