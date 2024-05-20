import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista no Google Drive',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> minhaLista = ["Item 1", "Item 2", "Item 3"];

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'https://www.googleapis.com/auth/drive.file',
    ],
  );

  void _saveToGoogleDrive() async {
    try {
      // Autenticar com o Google Drive
      await _googleSignIn.signIn();

      // Obter o diretório temporário
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      File file = File('$tempPath/minha_lista.txt');

      // Escrever a lista em um arquivo
      await file.writeAsString(minhaLista.join('\n'));

      // Enviar o arquivo para o Google Drive
      final authHeaders = await _googleSignIn.currentUser.authHeaders;
      final client = http.Client();
      final driveApi = drive.DriveApi(client);
      var response = await driveApi.files.create(
        drive.File()..name = 'minha_lista.txt',
        uploadMedia: drive.Media(file.openRead(), file.lengthSync()),
        headers: await authHeaders,
      );
      print('Arquivo enviado com sucesso para o Google Drive: ${response.name}');
    } catch (error) {
      print('Erro ao enviar o arquivo para o Google Drive: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista no Google Drive'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Minha Lista:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Column(
              children: minhaLista.map((item) => Text(item)).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveToGoogleDrive,
              child: Text('Salvar no Google Drive'),
            ),
          ],
        ),
      ),
    );
  }
}


