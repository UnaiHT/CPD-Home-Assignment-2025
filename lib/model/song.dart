import 'dart:io';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

final Map<String,String> songUrlList = {
    'songs/Sleep_Token_Emergence.mp3':'Emergence',
    'songs/Electric_Callboy-Hypa_Hypa.mp3':'Hypa Hypa',
    'songs/Allt-Ephemeral.mp3':'Ephemeral',
    'Super_Mario_Bros_Theme_Song.mp3':'Super Mario Theme'
  };

class Song {
  Song({required this.id, required this.title, required this.artist, required this.duration, required this.url, this.imageFile});
  
  String id;
  final String title;
  final String artist;
  final String duration;
  final String url;
  File? imageFile;
}