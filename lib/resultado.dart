import 'package:flutter/material.dart';

class Resultado extends StatefulWidget {
  final String resultado;
  const Resultado({super.key, required this.resultado});

  @override
  State<Resultado> createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff61bd86),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(
              image: AssetImage("imagens/moeda_${widget.resultado}.png"),
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Image(image: AssetImage("imagens/botao_voltar.png")),
            )
          ],
        ),
      ),
    );
  }
}
