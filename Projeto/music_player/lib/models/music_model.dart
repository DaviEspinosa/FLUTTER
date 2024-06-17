class MusicModel {
  //atributos
  final String title;
  final String artist;
  final String url;

  MusicModel({required this.title, required this.artist, required this.url});

  //fromMap
  factory MusicModel.fromJson(Map<String, dynamic> json) {
    return MusicModel(
      title: json['title'],
      artist: json['artist'],
      url: json['url'],
    );
  }
}
