import 'dart:convert';

import 'package:projeto_player/model/music_model.dart';

import 'package:http/http.dart' as http;

class MusicService{
  final Uri url = "http://URL_JSON.com" as Uri;

  List<MusicModel> _listMusic = [];
  List<MusicModel> get listMusic => _listMusic;

  // fetch lista de musicas 
  Future<List<MusicModel>> fetchListMusic() async {
    final response = await http.get(url);
    if(response.statusCode == 200){
      _listMusic = json.decode(response.body).map<MusicModel>((item) =>
       MusicModel.fromJson(item)).toList();
    }
    return _listMusic;
  }
}