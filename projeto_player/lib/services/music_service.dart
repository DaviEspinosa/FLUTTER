
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:projeto_player/model/music_model.dart';

class MusicService {
  List<Music> _list = [];  
  List<Music> get list => _list;

  final String url = "http://192.168.56.1:3000/music";

  //fetchList()
  Future<List<Music>> fetchList() async{
    final Response  response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      final List<dynamic> list = json.decode(response.body);
      _list.clear();
      _list.addAll(list.map((e) => Music.fromJson(e)).toList());
      return _list;
    }
    return [];

  }
}