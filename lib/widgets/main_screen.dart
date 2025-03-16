import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:home_assignment_app/model/song.dart';
import 'package:home_assignment_app/widgets/new_song.dart';
import 'package:home_assignment_app/widgets/song_list.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }

}

class _MainState extends State<MainScreen> {

  List<Song> songList = [];
  

  var isLoading = true;

  @override
  void initState(){
    super.initState();
    _loadItems();
  }

  Future _loadItems() async {
    final url = Uri.https('hba-cpd-2025-default-rtdb.europe-west1.firebasedatabase.app', 'song-list.json');
    
    final response = await http.get(url);
    
    final List<Song> loadedList = [];

    if(response.body.isNotEmpty && response.body != "null"){
      final Map<String, dynamic> firebaseData = json.decode(response.body);
    

    for(final item in firebaseData.entries){
      
      loadedList.add(Song(id: item.key, title: item.value["title"], artist: item.value["artist"], duration: item.value["duration"], url: item.value["url"]));

    }
    }
    setState(() {
      isLoading = false;
      songList = loadedList;
    });

  }


  void showAddSong() {
    showModalBottomSheet(context: context, builder: (ctx) => 
      NewSong(onAddSong: addSong)
    );
  }


  void addSong(Song song) async {
    final url = Uri.https('hba-cpd-2025-default-rtdb.europe-west1.firebasedatabase.app', 'song-list.json');

    final response = await http.post(url, 
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'title': song.title,
        'artist': song.artist,
        'duration': song.duration,
        'url':song.url
      }));
    Map<String, dynamic> responseData = json.decode(response.body);

      if(!context.mounted){
        return;
      }
    song.id = responseData["name"];
    setState(() {
      songList.add(song);
    });
  }

  void deleteSong(Song song) {

    final url = Uri.https('hba-cpd-2025-default-rtdb.europe-west1.firebasedatabase.app', 'song-list/${song.id}.json');

    final index = songList.indexOf(song);

    http.delete(url);
    setState(() {
      songList.remove(song);
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Expense Deleted"), 
      duration: const Duration(seconds: 3),
      action: SnackBarAction(label: "Undo", onPressed: () async {

    final response = await http.post(url, 
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'title': song.title,
        'artist': song.artist,
        'duration': song.duration,
        'url':song.url
      }));
        setState(() {
          songList.insert(index, song);
        });
      }, )));
  }  


  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text("No Songs in the list !"),
    );

    if(isLoading){
      content = const Center(
        child: CircularProgressIndicator(),
      );
    }
    if(songList.isNotEmpty){
      content = Expanded(child: SongList(onDeleteSong: deleteSong ,songs: songList));
    }

    return Scaffold(appBar: AppBar(
      title: const Text("Song Player"),
      actions: [IconButton(onPressed: showAddSong, icon: const Icon(Icons.add))],
      ),
      body: Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
                
        
        content

      ],
    )), 
    );
  }

}