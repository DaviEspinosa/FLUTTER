  import 'package:path/path.dart';
import 'package:sa3_projeto/Model/Usuario.dart';
import 'package:sqflite/sqflite.dart';

class BancoDados {
  
static const String BD_NAME = 'usuarios.db'; // Nome do banco de dados
static const String TABLE_NAME = 'usuarios'; // Nome da tabela
static const String SCRIPT_CREATE_TABLE = // Script SQL para criar a tabela
      "CREATE TABLE IF NOT EXISTS usuarios("+
        "id SERIAL PRIMARY KEY," +
        "user_name TEXT," + 
        "user_email TEXT UNIQUE," +
        "user_senha TEXT)";

  //Criando e Referenciando a tabela
  Future<Database> _getDatabase() async{
    return openDatabase(
      join(await getDatabasesPath(), BD_NAME),
      onCreate: (db, version) {
        print("Criadoooo");
        return db.execute(SCRIPT_CREATE_TABLE); 
      },
      version : 1,
    );
  }

  // Método para criar um novo contato no banco de dados
  Future<void> create(Usuario model) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(
          TABLE_NAME, model.toMap()); // Insere dados no banco de dados
    } catch (ex) {
      print(ex);
      return;
    }
  }

    // Método para obter Usuarios do banco de dados
  Future<Usuario?> getUsuario(String email, String senha) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(TABLE_NAME,
          where: 'user_email = ? AND user_senha = ?',
          whereArgs: [email,senha]
          ); 

      if (maps.isNotEmpty){
        return Usuario.fromMap(maps[0]);
      }
      else{
        return null;
      }
    } catch (ex) {
      print(ex);
      return null;
    }
  }

    // Ver se o usuario existe
  Future<bool> existsUsuario(String email, String senha) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps =
          await db.query(TABLE_NAME,
          where: 'user_email = ? AND user_senha = ?',
          whereArgs: [email,senha]
          ); // Consulta todos os contatos na tabela

      if (maps.isNotEmpty){
        return true;
      }else{
        return false;
      }
    } catch (ex) {
      print(ex);
      return false;
    }
  }
}

