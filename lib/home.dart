import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ImagePicker picker = ImagePicker();
  XFile? pickedFile;
  String statusUpload = "";
  String _urlImagemRecuperada = "";

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

  Future<void> _uploadImagem() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference storageReference =
        storage.ref().child('pasta/para/upload/foto1.jpg');

    // Obtenha o caminho do arquivo do XFile e crie um File a partir dele
    if (pickedFile != null) {
      File file = File(pickedFile!.path);

      // Faça o upload do arquivo para o Firebase Storage
      UploadTask task = storageReference.putFile(file);

      // Controlar o processo do upload
      task.snapshotEvents.listen((TaskSnapshot snapshot) {
        if (snapshot.state == TaskState.running) {
          double progress =
              (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          setState(() {
            statusUpload =
                'Progresso do upload: ${progress.toStringAsFixed(2)}%';
          });
        } else if (snapshot.state == TaskState.success) {
          setState(() {
            statusUpload = 'Upload concluído!';
          });
        }
      });

      task.whenComplete(() async {
        try {
          final url = await storageReference.getDownloadURL();
          _recuperarUrlImagem(url);
        } catch (e) {
          print('Erro ao recuperar a URL da imagem: $e');
        }
      });
    } else {
      print('Nenhum arquivo selecionado');
    }
  }

  void _recuperarUrlImagem(String url) {
    setState(() {
      _urlImagemRecuperada = url;
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
            ElevatedButton(
                onPressed: () {
                  _uploadImagem();
                },
                child: const Text("Upload Storage")),
            Text(statusUpload),
            _urlImagemRecuperada == ""
                ? Container()
                : Image.network(_urlImagemRecuperada)
          ],
        ),
      ),
    );
  }
}
