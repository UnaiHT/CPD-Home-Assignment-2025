import 'package:flutter/material.dart';
import 'package:home_assignment_app/model/song.dart';
import 'package:home_assignment_app/widgets/song_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }

}

class _MainState extends State<MainScreen> {

  List<Song> songList = [
      Song(title: "Emergence", artist: "Sleep Token", duration: "6:47", url: "songs/Sleep_Token_Emergence.mp3"),
      Song(title: "Super Mario Bros Theme", artist: "Nintendo", duration: "3:05", url: "songs/Super_Mario_Bros_Theme_Song.mp3"),
    ];

  void showSong(Song song) async {

  }  


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: const Text("Song Player"),
      actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.add))],
      ),
      body: Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
                
        /*...myExpenses.map((exp) {
          return Text(exp.title);
        })*/
        Expanded(child: SongList(songs: songList))

      ],
    )), 
    );
  }

}