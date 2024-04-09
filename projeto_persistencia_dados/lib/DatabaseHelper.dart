import 'package:projeto_persistencia_dados/CadastroModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const String DATABASE_NAME = 'cadastro.db';
  static const String TABLE_NAME = 'cadastro';
  static const String CREATE_SQL = "CREATE TABLE cadastro(email TEXT, senha TEXT)";

  Future<Database> _getDatabase() async {
    return openDatabase(
      //Caminho do  banco de dados
      join(await getDatabasesPath(), DATABASE_NAME),
      onCreate: ((db, version) {
        // executa o script de criação da tabela qunado o banco é criado
        return db.execute(CREATE_SQL);
      })
    );
  }

  // Método para criar um novo contato no banco de dados
  Future<void> create(CadastroModel model) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(
          TABLE_NAME, model.toMap()); // Insere dados no banco de dados
    } catch (ex) {
      print(ex);
      return;
    }
  }

  // Método para obter todos os contatos do banco de dados
  Future<List<CadastroModel>> getCadastro() async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(TABLE_NAME); // Consulta todos os contatos na tabela

      return List.generate(
        maps.length,
        (i) {
          return CadastroModel.fromMap(maps[
              i]); // Converte os resultados da consulta para objetos ContactModel
        },
      );
    } catch (ex) {
      print(ex);
      return [];
    }
  }

  Future<bool> emailResgistrado(String email) async{
    final db = await DatabaseHelper.instance.database;
    final results = await db.query(
      'cadastro',
      where: 'email = ?',
      whereArgs: [email],
    );
    return results.isNotEmpty;
  }

}