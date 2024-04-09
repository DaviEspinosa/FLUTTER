import 'package:projeto_persistencia_dados/CadastroModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const String DATABASE_NAME = 'cadastro.db';
  static const String TABLE_NAME = 'cadastro';
  static const String CREATE_SQL = "CREATE TABLE cadastro(email TEXT, senha TEXT)";

  Future<Database> _getDatabase

}