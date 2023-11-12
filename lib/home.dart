import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.grey, opacity: 1),
        title: Image.asset(
          "imagens/youtube.png",
          width: 98,
          height: 22,
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                print("ação: videocam");
              },
              icon: const Icon(Icons.videocam)),
          IconButton(
              onPressed: () {
                print("ação: pesquisa");
              },
              icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                print("ação: pesquisa");
              },
              icon: const Icon(Icons.account_circle))
        ],
      ),
      body: Container(),
    );
  }
}
