class Music {
  final String titulo;
  final String artista;
  final String url;

  Music({required this.titulo, required this.artista, required this.url});

  factory Music.fromJson(Map<String, dynamic> json) {
    return Music(
      titulo: json['titulo'],
      artista: json['artista'],
      url: json['url'],
    );
  }
}
