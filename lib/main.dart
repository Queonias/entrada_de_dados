import 'package:entrada_dados/tela_secundaria.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TelaPrincial(),
  ));
}

class TelaPrincial extends StatefulWidget {
  const TelaPrincial({super.key});

  @override
  State<TelaPrincial> createState() => _TelaPrincialState();
}

class _TelaPrincialState extends State<TelaPrincial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela Principal"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SegundaTela(),
                    ));
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(15),
              ),
              child: const Text("Ir para segunda tela"),
            )
          ],
        ),
      ),
    );
  }
}
