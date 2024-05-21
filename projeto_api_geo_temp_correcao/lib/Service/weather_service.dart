import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {

  // Weather service serve para fazer a conexão com a api

  // atributos
  final String apiKey = 'b9ebe666087f299f5e2aad3a03d093b6';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  // métodos
  // Método para obter dados de previsão do tempo para uma cidade específica.
  Future<Map<String, dynamic>> getWeather(String city) async {

    final url = Uri.parse('$baseUrl?q=$city&appid=$apiKey');
    final response = await http.get(url);
    // Verifica se a resposta foi bem-sucedida (código de status 200).
    if (response.statusCode == 200) {
      // Se a resposta foi bem-sucedida, decodifica o corpo da resposta de JSON para um mapa.
      return jsonDecode(response.body);
    } else {
      // Se a resposta não foi bem-sucedida, lança uma exceção indicando o erro.
      throw Exception('Failed to load weather data');
    }
  }

  Future<Map<String, dynamic>> getWeatherbyLocation(double lat, double long) async {

    final url = Uri.parse('$baseUrl/weather?q=$lat&$long&appid=$apiKey');
    final response = await http.get(url);
    // Verifica se a resposta foi bem-sucedida (código de status 200).
    if (response.statusCode == 200) {
      // Se a resposta foi bem-sucedida, decodifica o corpo da resposta de JSON para um mapa.
      return jsonDecode(response.body);
    } else {
      // Se a resposta não foi bem-sucedida, lança uma exceção indicando o erro.
      throw Exception('Failed to load weather data');
    }
  }

}