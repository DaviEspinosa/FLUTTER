import 'package:flutter/material.dart';
import 'package:projeto_player/screen/music_player_screen.dart';
import 'package:projeto_player/services/music_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MusicService _musicService = MusicService();

  Future<void> _getList() async{
    try {
      await _musicService.fetchList();
    } catch (e) {
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: 
      Padding(
        padding: EdgeInsets.all(8),
        child: Center(
          child:Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: _getList(), 
                  builder: (context,snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator());
                    }else if(_musicService.list.isEmpty){
                      return Center(child: Text('Não há músicas'));
                    }else{
                      return ListView.builder(
                        itemCount: _musicService.list.length,
                        itemBuilder: (context,index){
                          return ListTile(
                            title: Text(_musicService.list[index].titulo),
                            subtitle: Text(_musicService.list[index].artista),
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => 
                                    MusicPlayerScreen(music: _musicService.list[index])),
                              );
                            },
                          );
                        });
                    }
                  }))
            ],)
        ),)
    );
  }
}