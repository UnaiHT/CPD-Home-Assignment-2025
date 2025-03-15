import 'package:flutter/material.dart';
import 'package:home_assignment_app/model/song.dart';
import 'package:home_assignment_app/widgets/song_screen.dart';

class SongItem extends StatelessWidget {
  const SongItem({required this.song, super.key});

  final Song song;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SongScreen(song: song),
          ),
        );
      },
    
    
    child: Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(song.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(song.artist),
                const SizedBox(width: 10),
                Text(song.duration),
                
              ],
            )
          ],
        ),
      )
    ),);
  }

}