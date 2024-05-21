import 'package:projeto_api_geo_temp_correcao/Service/weather_service.dart';

import '../Model/weather_model.dart';

class WeatherController {
  
  // atributos
  List<Weather> _weatherList = [];
  //get 
  List<Weather> get weatherList => _weatherList;

  WeatherService _service = WeatherService();
  // métodos
  Future<void> getWeather(String city) async{
    try {
      Weather weather = Weather.fromJson(await _service.getWeather(city));
      _weatherList.add(weather);
    } 
    catch (e) {
      print(e);
    }
  }

  Future<void> getWeatherbyLocation(double lat, double long) async{
    try {
      Weather weather = Weather.fromJson(await _service.getWeatherbyLocation(lat, long));
      _weatherList.add(weather);
    } 
    catch (e) {
      print(e);
    }
  }
}