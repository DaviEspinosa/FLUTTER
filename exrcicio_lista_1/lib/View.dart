import 'package:flutter/material.dart';

class View extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        title: Text('List View'),
        titleTextStyle: TextStyle(color: Color.fromRGBO(255,255,255,1)),
        backgroundColor: Color.fromRGBO(15, 75, 42, 1),
      ),

      body: Center(
        child: Container(
          child: Column(
            children: [
              Text("data"),
              Text("data"),
              Text("data"),
            ],
          ),
        ),
      ),
    );
  } 
}
