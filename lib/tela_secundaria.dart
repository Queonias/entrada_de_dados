import 'package:flutter/material.dart';

class SegundaTela extends StatefulWidget {
  final String valor;
  const SegundaTela({super.key, required this.valor});

  @override
  State<SegundaTela> createState() => _SegundaTelaState();
}

class _SegundaTelaState extends State<SegundaTela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela secundária"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const Text("Segunda tela!!!"),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/");
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(15),
              ),
              child: const Text("Ir para primeira tela"),
            )
          ],
        ),
      ),
    );
  }
}
