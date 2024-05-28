class City  {
  //atributos
  final String cityName;
  final bool favoritesCities;
  //construtor
  City({required this.cityName, required this.favoritesCities});

  //métodos
  //toMap
  Map<String, dynamic> toMap() {
    return {
      'cityname': cityName,
      'favoritescities': favoritesCities,
    };
  }
  //fromMap
  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      cityName: map['cityname'],
      favoritesCities: map['favoritescities'],
    );
  }
}