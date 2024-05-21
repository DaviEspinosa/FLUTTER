import 'package:flutter/material.dart';

import 'package:projeto_api_geo_temp_correcao/View/details_weather_screen.dart';
import 'package:projeto_api_geo_temp_correcao/View/favorites_screen.dart';
import 'package:projeto_api_geo_temp_correcao/View/search_screen.dart';
import 'package:projeto_api_geo_temp_correcao/View/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Projeto API GEO",
      home: HomeScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/search': (context) => SearchScreen(),
        '/favorites': (context) => FavoritesScreen(),
        '/details': (context) => DetailsWeatherScreen(),
      }
    );
  }
}