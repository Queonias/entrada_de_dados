import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ImagePicker picker = ImagePicker();
  XFile? pickedFile;

  Future<void> _recuperarImagem(bool daCamera) async {
    XFile? pickedImage;

    if (daCamera) {
      pickedImage = await picker.pickImage(source: ImageSource.camera);
    } else {
      pickedImage = await picker.pickImage(source: ImageSource.gallery);
    }

    setState(() {
      pickedFile = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  _recuperarImagem(true);
                },
                child: const Text("Camera")),
            ElevatedButton(
                onPressed: () {
                  _recuperarImagem(false);
                },
                child: const Text("Galeria")),
            if (pickedFile != null)
              Image.file(
                File(pickedFile!.path),
                height: 300, // Ajuste a altura conforme necessário
                width: 300, // Ajuste a largura conforme necessário
              ),
          ],
        ),
      ),
    );
  }
}
