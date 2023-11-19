import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AudioPlayer audioPlayer = AudioPlayer();
  double volume = 0.5;

  _executar() async {
    String url = "audios/musica.mp3";
    await audioPlayer.play(AssetSource(url));
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Executando sons"),
      ),
      body: Column(
        children: [
          Slider(
            value: volume,
            min: 0,
            max: 1,
            divisions: 10,
            onChanged: (value) {
              setState(() {
                volume = value;
              });
              audioPlayer.setVolume(volume);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () {
                    _executar();
                  },
                  child: Image.asset("assets/imagens/executar.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () {
                    _pausar();
                  },
                  child: Image.asset("assets/imagens/pausar.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () {
                    _parar();
                  },
                  child: Image.asset("assets/imagens/parar.png"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
