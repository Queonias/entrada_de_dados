import 'package:flutter/material.dart';

class Bichos extends StatefulWidget {
  const Bichos({super.key});

  @override
  State<Bichos> createState() => _BichosState();
}

class _BichosState extends State<Bichos> {
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
            onTap: () {},
            child: Image.asset("assets/imagens/cao.png"),
          ),
          GestureDetector(
            onTap: () {},
            child: Image.asset("assets/imagens/gato.png"),
          ),
          GestureDetector(
            onTap: () {},
            child: Image.asset("assets/imagens/leao.png"),
          ),
          GestureDetector(
            onTap: () {},
            child: Image.asset("assets/imagens/macaco.png"),
          ),
          GestureDetector(
            onTap: () {},
            child: Image.asset("assets/imagens/ovelha.png"),
          ),
          GestureDetector(
            onTap: () {},
            child: Image.asset("assets/imagens/vaca.png"),
          ),
        ],
      ),
    );
  }
}
