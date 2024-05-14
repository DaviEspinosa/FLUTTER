import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static late Database _database;

  static Future<void> initializeDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'weather_app.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE WeatherHistory(id INTEGER PRIMARY KEY, city TEXT, temperature REAL, condition TEXT, timestamp TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertWeatherData(String city, double temperature, String condition) async {
    await _database.insert(
      'WeatherHistory',
      {
        'city': city,
        'temperature': temperature,
        'condition': condition,
        'timestamp': DateTime.now().toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

static Future<void> insertFavorites(String city) async{
await _database.insert('Favorites',
{
  'nomeCity': city
},
conflictAlgorithm: ConflictAlgorithm.replace,
);
}


  static Future<List<Map<String, dynamic>>> getWeatherHistory() async {
    return _database.query('WeatherHistory', orderBy: 'timestamp DESC');
  }
}
