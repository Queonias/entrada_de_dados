import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AudioPlayer audioPlayer = AudioPlayer();

  _executar() async {
    String url = "audios/musica.mp3";
    await audioPlayer.play(AssetSource(url));
  }

  @override
  void initState() {
    super.initState();
    _executar();
  }

  @override
  Widget build(BuildContext context) {
    // _executar();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
    );
  }
}
