import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:projeto_api_geo_temp_correcao/Controller/weather_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherController _controller = WeatherController();

  @override
  void initState() {
    super.initState();
    _getWeather(); //buscando dados
  }

  Future<void> _getWeather() async {
    try {
      Position _position = await Geolocator.getCurrentPosition();
      _controller.getWeatherbyLocation(
        _position.latitude,
        _position.longitude,
      );
      setState(() {});
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao obter localização ou dados do tempo.'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Previsão do Tempo"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/favorites');
                    },
                    child: Text("Favoritos"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      textStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/search');
                    },
                    child: Text("Localização"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      textStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // mostrar informação weather
              _controller.weatherList.isEmpty
                  ? Column(
                      children: [
                        Text("Localização Não Encontrada"),
                        IconButton(
                          icon: Icon(Icons.refresh),
                          onPressed: () {
                            _getWeather();
                          },
                        )
                      ],
                    )
                  : Column(
                      children: [
                        Text(_controller.weatherList.last.name,
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        Text(_controller.weatherList.last.main,
                            style: TextStyle(fontSize: 18)),
                        Text(_controller.weatherList.last.description,
                            style: TextStyle(fontSize: 18)),
                        Text(
                          "${(_controller.weatherList.last.temp - 273).toStringAsFixed(1)} °C",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Máx: ${(_controller.weatherList.last.tempMax - 273).toStringAsFixed(1)} °C",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Min: ${(_controller.weatherList.last.tempMin - 273).toStringAsFixed(1)} °C",
                          style: TextStyle(fontSize: 18),
                        ),
                        IconButton(
                          icon: Icon(Icons.refresh),
                          onPressed: () {
                            _getWeather();
                          },
                        )
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
