import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Song {
  Song({required this.title, required this.artist, required this.duration, required this.url})
  :id = uuid.v4();
  
  final String id;
  final String title;
  final String artist;
  final String url;
  final String duration;
}