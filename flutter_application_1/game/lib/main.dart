import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  TextEditingController _controllerNumero1 = TextEditingController();
  int? _numeroSorteado;
  String _resultado = '';

  @override
  void initState() {
    super.initState();
    _numeroSorteado = _gerarNumeroAleatorio();
  }

  int _gerarNumeroAleatorio() {
    final random = Random();
    return random.nextInt(100) + 1;
  }

  void _jogar() {
    int? numeroDigitado = int.tryParse(_controllerNumero1.text);

    if (numeroDigitado != null) {
      setState(() {
        if (numeroDigitado == _numeroSorteado) {
          _resultado = 'Parabéns! Você acertou o número $_numeroSorteado';
        } else if(numeroDigitado > _numeroSorteado!){
          _resultado = 'Tente um número menor';
        }else if(numeroDigitado < _numeroSorteado!){
          _resultado = 'Tente um número maior';
        }
        else {
          // _resultado = 'Tente novamente!';
        }
      });
    } else {
      setState(() {
        _resultado = 'Por favor, digite um número válido.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controllerNumero1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Digite um Número'),
              
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () => _jogar(),
              child: Text('Sortear'),
            ),
            SizedBox(height: 16.0),
            Text(
              _resultado,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
