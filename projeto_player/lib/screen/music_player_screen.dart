import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:projeto_player/model/music_model.dart';

class MusicPlayerScreen extends StatefulWidget {
  final Music music;
  const MusicPlayerScreen({super.key,required this.music});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  late AudioPlayer _audio = AudioPlayer();
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audio = AudioPlayer();
  }
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    _isPlaying = !_isPlaying;
  }
  
  @override
  void dispose() {
    _audio.dispose();
    super.dispose();
  }
  void _playPause() {
    if (_isPlaying) {
      _audio.pause();
    } else {
      _audio.play(UrlSource(widget.music.url));
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.music.titulo),
      ),
      body: Center(
        child: IconButton(
          icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
          iconSize: 64.0,
          onPressed: _playPause,
        ),
      ),
    );
  }
}
