import 'package:flutter/material.dart';
import 'package:home_assignment_app/model/song.dart';
import 'package:home_assignment_app/widgets/song_item.dart';

class SongList extends StatelessWidget {
  const SongList({required this.onDeleteSong, required this.songs,super.key});

  final List<Song> songs;

  final void Function(Song) onDeleteSong;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(songs[index]),
        background: Container(color: const Color.fromARGB(255, 238, 238, 238),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(20),
          child: const Icon(Icons.delete, color: Colors.red,)),
        secondaryBackground: Container(color: Colors.blue),
        direction: DismissDirection.startToEnd,
        
        onDismissed: (direction) {
          if(direction == DismissDirection.startToEnd){
            onDeleteSong(songs[index]);
          }
        },

        child: SongItem(song: songs[index]))

      
    );
  }

}