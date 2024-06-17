import 'package:projeto_api_geo_temp_correcao/Model/city_model.dart';
import 'package:projeto_api_geo_temp_correcao/Service/city_db_service.dart';

class CityDbController {
  // atributos
  List<City> _cities=[];
  final CityDbService _dbService = CityDbService();
  List<City> getCities() => _cities;

  //métodos
  //list from db
  Future<List<City>> listCities() async {
    List<Map<String, dynamic>> maps = await _dbService.listCity();
    // for(Map<String,dynamic> map in maps){
    //     _cities.add(City.fromMap(map));
    //   }
    _cities = maps.map<City>((e) =>   City.fromMap(e)).toList();
    return _cities;
  }
  //add city
  Future<void> addCity(City city) async {
    await _dbService.insertCity(city);
  }
  //update city
  Future<void> updateCity(City city) async {
    await _dbService.updateCity(city);
  }
  //delete city
  Future<void> deleteCity(String city) async {
    await _dbService.deleteCity(city);
  }
}
