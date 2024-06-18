import 'package:flutter/material.dart';
import 'package:projeto_api_geo_temp_correcao/Controller/weather_controller.dart';

class WeatherDetailsScreen extends StatefulWidget {
  final String cityName;
  const WeatherDetailsScreen({Key? key, required this.cityName}) : super(key: key);

  @override
  State<WeatherDetailsScreen> createState() => _WeatherDetailsScreenState();
}

class _WeatherDetailsScreenState extends State<WeatherDetailsScreen> {
  final WeatherController _controller = WeatherController();

  @override
  void initState() {
    _controller.getWeather(widget.cityName); // Carregar dados do clima ao inicializar a tela
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cityName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Detalhes do Clima',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            FutureBuilder(
              future: _controller.getWeather(widget.cityName),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (_controller.weatherList.isEmpty) {
                  return Center(child: Text('Dados não encontrados'));
                } else {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _controller.weatherList.last.name,
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: Icon(Icons.favorite_border_outlined),
                            onPressed: () {
                              // Adicionar aos favoritos
                              // Implemente a lógica para adicionar aos favoritos aqui
                            },
                          ),
                        ],
                      ),
                      Text(
                        _controller.weatherList.last.description,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        '${(_controller.weatherList.last.temp - 273.15).toStringAsFixed(2)} °C',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
