import 'package:entrada_dados/api.dart';
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    Api api = Api();
    api.pesquisa("pesquisa");
    return const Center(
      child: Text(
        "Início",
        style: TextStyle(fontSize: 25),
      ),
    );
  }
}
