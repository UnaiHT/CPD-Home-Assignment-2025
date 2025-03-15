import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:home_assignment_app/model/song.dart';

class SongScreen extends StatelessWidget {
  SongScreen({required this.song, super.key});

  final Song song;
  bool songPlaying = false;

  final player = AudioPlayer();

  void _playSong() async {
    if(!songPlaying){
      await player.play(AssetSource(song.url));
      songPlaying=true;
    }
    else{
      player.pause();
      songPlaying=false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(song.title),
      actions: [IconButton(onPressed: _playSong, icon: const Icon(Icons.play_arrow))],
      ),
      body: Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(song.artist),
        const SizedBox(height: 15),
        Text(song.duration)
      ],),),);
  }

}