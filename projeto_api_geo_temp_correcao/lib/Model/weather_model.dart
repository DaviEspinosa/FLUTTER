class Weather {
  // atributos
  final String name;
  final String main;
  final String description;
  final double temp;
  final double tempMax;
  final double tempMin;

  //construtor
  Weather(
      {required this.name,
      required this.main,
      required this.description,
      required this.temp,
      required this.tempMax,
      required this.tempMin}
  );

  //método
  //criando uma factory porque ela faz o fromJson o json
  factory Weather.fromJson(Map<String,dynamic> json){
    return Weather(
      name: json['name'],
      description: json['weather'][0]['description'],
      main: json['main'],
      temp: json['main']['temp'],
      tempMax: json['main']['tempMax'],
      tempMin: json['main']['tempMin'],
    );
  }

}
