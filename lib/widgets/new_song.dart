import 'package:flutter/material.dart';
import 'package:home_assignment_app/model/song.dart';

class NewSong extends StatefulWidget {
  const NewSong({required this.onAddSong, super.key});

  final void Function(Song) onAddSong;

  @override
  State<StatefulWidget> createState() {
    return _NewSongState();
  }

}

class _NewSongState extends State<NewSong> {

  

  final _titleController = TextEditingController();

  final _artistController = TextEditingController();

  final _durationController = TextEditingController();

  String _selectedSong = songUrlList.keys.first;

  void _submitSong(){

    if(_titleController.text.trim().isEmpty || _artistController.text.trim().isEmpty || _durationController.text.trim().isEmpty){

      showDialog(
        context: context, builder: (ctx) => AlertDialog(
          title: const Text("Invalid Input"),
          content: const Text("Make sure a valid title, artist and duration were entered."),
          actions: [TextButton(onPressed: (){Navigator.pop(ctx);}, child: const Text("OK"))],));
    }
    else{
      Song song = Song(
        id: "temporary_id",
        title: _titleController.text, 
        artist: _artistController.text,
        duration: _durationController.text, 
        url: _selectedSong);

      widget.onAddSong(song);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
           const Text("Add New Song", style: TextStyle(fontWeight: FontWeight.bold),),
          TextField(
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(label: Text("Song Title")),
            controller: _titleController,
            ),
          TextField(
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(label: Text("Artist Name")),
            controller: _artistController,
            ),
          TextField(
            maxLength: 5,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(label: Text("Duration")),
            controller: _durationController,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              DropdownButton(
                value: _selectedSong,
                items: songUrlList.entries.map((song) {
                  return DropdownMenuItem(
                    value:song.key,
                    child: Text(song.value));
                }).toList(),
                onChanged: (value){
                  setState(() {
                    _selectedSong = value!;
                  });
                },
              ),
            
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: (){Navigator.pop(context);}, child: const Text("Cancel")),
                    ElevatedButton(onPressed: _submitSong, child: const Text("Add Song")),
                  ],
                ),
              ),
              
            ],
          )
        ],),);
  }

}