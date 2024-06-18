import 'package:flutter/material.dart';
import 'package:projeto_api_geo_temp_correcao/Controller/city_db_controller.dart';
import 'package:projeto_api_geo_temp_correcao/Controller/weather_controller.dart';
import 'package:projeto_api_geo_temp_correcao/View/details_weather_screen.dart';

import '../Model/city_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cityController = TextEditingController();
  final WeatherController _controller = WeatherController();
  final CityDbController _dbController = CityDbController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pesquisa")),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _cityController,
                  decoration: InputDecoration(hintText: "Digite o nome da cidade"),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Por favor, digite uma cidade";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _cityFind(_cityController.text);
                    }
                  },
                  child: const Text("Buscar"),
                ),
                SizedBox(height: 12),
                Expanded(
                  child: FutureBuilder(
                    future: _dbController.listCities(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasData && _dbController.getCities().isNotEmpty) {
                        return ListView.builder(
                          itemCount: _dbController.getCities().length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(_dbController.getCities()[index].cityName),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WeatherDetailsScreen(
                                      cityName: _dbController.getCities()[index].cityName,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      }
                      return Center(child: Text("Nenhuma cidade adicionada"));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _cityFind(String city) async {
    if (await _controller.findCity(city)) {
      // Adicionar cidade ao banco de dados
      City cityToAdd = City(cityName: city, favoritesCities: false);
      _dbController.addCity(cityToAdd);

      // Exibir snackbar de cidade encontrada
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Cidade encontrada"),
          duration: Duration(seconds: 1),
        ),
      );

      // Navegar para a tela de detalhes do clima
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WeatherDetailsScreen(cityName: city),
        ),
      );
      setState(() {});
    } else {
      // Exibir snackbar de cidade não encontrada e limpar campo de texto
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Cidade não encontrada"),
          duration: Duration(seconds: 2),
        ),
      );
      _cityController.clear();
    }
  }
}
