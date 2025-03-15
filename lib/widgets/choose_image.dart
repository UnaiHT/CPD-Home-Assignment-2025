import 'package:flutter/material.dart';

class ChooseImage extends StatelessWidget{
  const ChooseImage({required this.pickImageFromGallery, required this.pickImageFromCamera, super.key});

  final void Function() pickImageFromGallery;

  final void Function() pickImageFromCamera;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment : MainAxisAlignment.center,
      children: [
        const Text("Where do you want to choose the image from ?"),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        MaterialButton(
                  onPressed: pickImageFromGallery,
                  color: const Color.fromARGB(255, 206, 205, 205),
                  child: const Text(
                    "Gallery",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                const SizedBox(width: 20),
                MaterialButton(
                  onPressed: pickImageFromCamera,
                  color: const Color.fromARGB(255, 206, 205, 205),
                  child: const Text(
                    "Camera",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
      ]),]
    );
  }
}