import 'package:flutter/material.dart';

class SegundaPagina extends StatefulWidget {
  const SegundaPagina({super.key});

  @override
  State<SegundaPagina> createState() => _SegundaPaginaState();
}

class _SegundaPaginaState extends State<SegundaPagina> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Email"));
  }
}
