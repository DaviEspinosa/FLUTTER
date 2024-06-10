class MusicModel {
  final String titulo;
  final String artista;
  final String url;

  MusicModel({required this.titulo, required this.artista, required this.url});

  factory MusicModel.fromJson(Map<String, dynamic> json) {
    return MusicModel(
      titulo: json['titulo'],
      artista: json['artista'],
      url: json['url'],
    );
  }
}
