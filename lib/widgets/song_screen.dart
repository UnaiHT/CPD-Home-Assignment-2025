import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:home_assignment_app/model/song.dart';
import 'package:home_assignment_app/widgets/choose_image.dart';
import 'package:image_picker/image_picker.dart';

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

    Future pickImageFromGallery() async{
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(returnedImage == null) return;
    
    setState(() {
      widget.song.imageFile = File(returnedImage.path);
      Navigator.pop(context);

    });
  }

  Future pickImageFromCamera() async{
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);

    if(returnedImage == null) return;
    
    setState(() {
      widget.song.imageFile = File(returnedImage.path);
      Navigator.pop(context);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(widget.song.title),
      actions: [IconButton(onPressed: _playSong, icon: Icon(songPlaying ? Icons.pause : Icons.play_arrow))],
      ),
      body: Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
                height: 10,
              ), 
             GestureDetector(
              onTap: (){
                showModalBottomSheet(context: context, builder: (ctx) => 
                  ChooseImage(pickImageFromCamera: pickImageFromCamera, pickImageFromGallery: pickImageFromGallery)
                );
              },
              child:
              widget.song.imageFile != null ? Image.file(widget.song.imageFile!) : Column(
               children: [
                Container(height: 200, color: Colors.transparent),
                const Text("Select a cover image", style: TextStyle(fontSize: 20)),
                Container(height: 200, color: Colors.transparent),
               ],
             ),),
             
        const SizedBox(height: 20),     
        Text(widget.song.artist, style: const TextStyle(fontSize: 20)),
        const SizedBox(height: 15),
        Text(widget.song.duration, style: const TextStyle(fontSize: 20))
      ],),),);
  }

}