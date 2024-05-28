import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../Model/city_model.dart';

class CityDbService {
  final String DATABASE_NAME = 'citydb.db'; // Nome do banco de dados
  final String TABLE_NAME = 'city'; // Nome da tabela
  final String CREATE_TABLE_SCRIPT = // Script SQL para criar a tabela
      """CREATE TABLE city(
          cityname TEXT PRIMARY KEY, 
          favoritesCities BOOLEAN
          )""";
  //método openDatabase
  Future<Database> _openDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(),DATABASE_NAME),
      onCreate: (db, version) => CREATE_TABLE_SCRIPT,
      version: 1,
    );
  }
  //crud
  //insert
  Future<void> insertCity(City city) async {
    try {
    Database db = await _openDatabase();
    db.insert(TABLE_NAME, city.toMap());
    db.close();
    } catch (e) {
      print(e);
    }
  }
  //list
  Future<List<Map<String,dynamic>>> listCity() async {
    try {
    Database db = await _openDatabase();
    List<Map<String, dynamic>> maps = await db.query(TABLE_NAME);
    db.close();      
    return maps;
    } catch (e) {
      print(e);
      return[];
    }
  }
  // delete
  Future<void> deleteCity(String city) async {
        try {
      Database db = await _openDatabase();
      db.delete(TABLE_NAME, where: 'cityname =?', whereArgs: [city]);
      db.close();
    } catch (e) {
      print(e);
    }
  }
  //update para cidades favoritas
  Future<void> updateCity(City city) async {
        try {
      Database db = await _openDatabase();
      db.update(TABLE_NAME, city.toMap(), where: 'cityname =?', whereArgs: [city.cityName]);
      db.close();
    } catch (e) {
      print(e);
    }
  }



}