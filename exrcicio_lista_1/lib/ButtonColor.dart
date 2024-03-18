import 'package:flutter/material.dart';
import 'dart:math' as Math;

class changeButtonColor extends StatefulWidget {
  @override
  _ColorChangeButtonState createState()=> _ColorChangeButtonState();
}


class ButtonColor extends State<_ColorChangeButton> {

  Color _buttonColor = Color.fromRGBO(182, 182, 182, 0.996)

  void _changeButtonColor(){
    setState(() {
      _buttonColor = Color((Math.Random().nextDouble()*0xFFFFFF).toInt()).withOpacity(1.0);
    });
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
                  child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: _buttonColor),
                onPressed: _changeButtonColor,
                 child: Text("Clique para mudança de cor"),
      ),),),
    );
  }
}