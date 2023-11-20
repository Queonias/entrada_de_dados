import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Bichos extends StatefulWidget {
  const Bichos({super.key});

  @override
  State<Bichos> createState() => _BichosState();
}

class _BichosState extends State<Bichos> {
  AudioPlayer audioPlayer = AudioPlayer();
  final AudioCache _audioCache = AudioCache();

  _executar(String nomeAudio) async {
    await audioPlayer.play(AssetSource(nomeAudio));
  }

  _pausar() async {
    await audioPlayer.pause();
  }

  _parar() async {
    await audioPlayer.stop();
  }

  @override
  void initState() {
    super.initState();
    _audioCache.loadAll([
      "audios/cao.mp3",
      "audios/gato.mp3",
      "audios/leao.mp3",
      "audios/macaco.mp3",
      "audios/ovelha.mp3",
      "audios/vaca.mp3",
    ]);
  }

  @override
  Widget build(BuildContext context) {
    // double largura = MediaQuery.of(context).size.width;
    // double altura = MediaQuery.of(context).size.height;

    return Center(
      child: GridView.count(
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
        children: [
          GestureDetector(
            onTap: () {
              _executar("audios/cao.mp3");
            },
            child: Image.asset("assets/imagens/cao.png"),
          ),
          GestureDetector(
            onTap: () {
              _executar("audios/gato.mp3");
            },
            child: Image.asset("assets/imagens/gato.png"),
          ),
          GestureDetector(
            onTap: () {
              _executar("audios/leao.mp3");
            },
            child: Image.asset("assets/imagens/leao.png"),
          ),
          GestureDetector(
            onTap: () {
              _executar("audios/macaco.mp3");
            },
            child: Image.asset("assets/imagens/macaco.png"),
          ),
          GestureDetector(
            onTap: () {
              _executar("audios/ovelha.mp3");
            },
            child: Image.asset("assets/imagens/ovelha.png"),
          ),
          GestureDetector(
            onTap: () {
              _executar("audios/vaca.mp3");
            },
            child: Image.asset("assets/imagens/vaca.png"),
          ),
        ],
      ),
    );
  }
}
