import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Numeros extends StatefulWidget {
  const Numeros({super.key});

  @override
  State<Numeros> createState() => _NumerosState();
}

class _NumerosState extends State<Numeros> {
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
      "audios/1.mp3",
      "audios/2.mp3",
      "audios/3.mp3",
      "audios/4.mp3",
      "audios/5.mp3",
      "audios/6.mp3",
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
        children: [
          GestureDetector(
            onTap: () {
              _executar("audios/1.mp3");
            },
            child: Image.asset("assets/imagens/1.png"),
          ),
          GestureDetector(
            onTap: () {
              _executar("audios/2.mp3");
            },
            child: Image.asset("assets/imagens/2.png"),
          ),
          GestureDetector(
            onTap: () {
              _executar("audios/3.mp3");
            },
            child: Image.asset("assets/imagens/3.png"),
          ),
          GestureDetector(
            onTap: () {
              _executar("audios/4.mp3");
            },
            child: Image.asset("assets/imagens/4.png"),
          ),
          GestureDetector(
            onTap: () {
              _executar("audios/5.mp3");
            },
            child: Image.asset("assets/imagens/5.png"),
          ),
          GestureDetector(
            onTap: () {
              _executar("audios/6.mp3");
            },
            child: Image.asset("assets/imagens/6.png"),
          ),
        ],
      ),
    );
  }
}
