import 'package:flutter/material.dart';

class TerceiraPagina extends StatefulWidget {
  const TerceiraPagina({super.key});

  @override
  State<TerceiraPagina> createState() => _TerceiraPaginaState();
}

class _TerceiraPaginaState extends State<TerceiraPagina> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Outra"));
  }
}
