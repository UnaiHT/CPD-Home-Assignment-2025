import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:home_assignment_app/model/song.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({required this.song, super.key});

  final Song song;
  @override
  State<StatefulWidget> createState() {
    return SongState();
  }

}

class SongState extends State<SongScreen> {

  
  bool songPlaying = false;

  final player = AudioPlayer();

  void _playSong() async {
    if(!songPlaying){
      songPlaying=true;
      await player.play(AssetSource(widget.song.url));
    }
    else{
      player.pause();
      songPlaying=false;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(widget.song.title),
      actions: [IconButton(onPressed: _playSong, icon: Icon(songPlaying ? Icons.pause : Icons.play_arrow))],
      ),
      body: Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.song.artist),
        const SizedBox(height: 15),
        Text(widget.song.duration)
      ],),),);
  }

}