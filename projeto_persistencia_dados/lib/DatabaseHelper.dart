import 'package:projeto_persistencia_dados/CadastroModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;
  static final _tableName = 'cadastros';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = await getDatabasesPath();
    final databasePath = join(path, 'cadastro_database.db');

    return openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, name TEXT, email TEXT, cpf INTEGER, senha TEXT)",
        );
      },
    );
  }

  Future<void> insertCadastro(CadastroModel cadastro) async {
    final db = await database;
    await db.insert(_tableName, cadastro.toMap());
  }

  Future<List<CadastroModel>> getCadastros() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    return List.generate(maps.length, (i) {
      return CadastroModel.fromMap(maps[i]);
    });
  }
}
