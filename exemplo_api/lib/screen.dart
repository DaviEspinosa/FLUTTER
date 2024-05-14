// Importa o pacote de widgets do Flutter, que contém os widgets para construir interfaces de usuário.
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

// Importa o serviço WeatherService, que é responsável por obter os dados de previsão do tempo da API.
import 'banco_dados.dart';
import 'service.dart';

// Classe StatefulWidget que representa o widget de previsão do tempo.
class WeatherScreen extends StatefulWidget {
  // Sobrescreve o método createState para criar e retornar uma instância do estado do widget.
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

// Classe que representa o estado do widget de previsão do tempo.
class _WeatherScreenState extends State<WeatherScreen> {

   List<String> _inputHistory = [];

  DatabaseService _databaseService = new DatabaseService();

  TextEditingController _cityController = new TextEditingController();


  final _formKey = GlobalKey<FormState>();
  // Instância do serviço WeatherService para obter os dados de previsão do tempo.
  final WeatherService _weatherService = WeatherService(
    apiKey:
        '681126f28e7d6fa3a7cfe0da0671e599', // Chave de API para acesso à API de previsão do tempo.
    baseUrl:
        'https://api.openweathermap.org/data/2.5', // URL base da API de previsão do tempo.
  );

  // Mapa que armazenará os dados de previsão do tempo.
  late Map<String, dynamic> _weatherData;

   @override
  void initState() {
    super.initState();
    _weatherData = {
      'name': '',
      'main': {'temp': 0},
      'weather': [{'description': ''}]
    };
  }

 Future<void> _fetchWeatherData(String city) async {
  try {
    final weatherData = await _weatherService.getWeather(city);
    setState(() {
      _weatherData = weatherData;
    });
    await DatabaseService.insertWeatherData(
      _weatherData['name'],
      (_weatherData['main']['temp'] - 273).toDouble(), // Converte para Celsius
      _weatherData['weather'][0]['description'],
    );
  } catch (e) {
    setState(() {
      _weatherData = {
        'name': 'Erro',
        'main': {'temp': 0},
        'weather': [{'description': 'Falha ao carregar dados de previsão do tempo'}]
      };
    });
  }
}


  Future<void> _fetchWeatherGeo() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      final weatherData = await _weatherService.getWeatherbyLocation(position.latitude, position.longitude);
      setState(() {
        _weatherData = weatherData;
      });
    } catch (e) {
      setState(() {
        _weatherData = {
          'name': 'Erro',
          'main': {'temp': 0},
          'weather': [{'description': 'Falha ao carregar dados de previsão do tempo'}]
        };
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecast'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Center(
          child: Form(
            key: _formKey, // Adiciona a chave do formulário
            child: Column(
              children: [
                TextFormField(
                  controller: _cityController,
                  decoration: InputDecoration(labelText: "Insira a Cidade"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, preencha o campo corretamente!!!';
                    }
                    else{
                      setState(() {
                        _inputHistory.insert(0, value);
                      });
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) { // Verifica se o formulário é válido
                      _fetchWeatherData(_cityController.text);
                    }
                  },
                  child: Text("Buscar"),
                ),
                SizedBox(height: 12),
                _weatherData == null
                    ? Center(child: CircularProgressIndicator()) // Adiciona um indicador de carregamento
                    : Column(
                        children: [
                          Text('Cidade: ${_weatherData['name']}'),
                          Text('Temperatura: ${_weatherData['main']['temp'] - 273} °C'),
                          Text('Descrição: ${_weatherData['weather'][0]['description']}'),
                        ],
                      ),
                Container(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(10), 
                      child:Column(
                        children: [
                          Text("Histórico de Pesquisa"),
                          Expanded(child: ListView.builder(
                            itemCount: _inputHistory.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(_inputHistory[index]),
                                onTap: () {
                                  _fetchWeatherData(_inputHistory[index]);
                                },
                              );
                            },
                          ) )
                        ],
                      ) , ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
