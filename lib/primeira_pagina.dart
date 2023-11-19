import 'package:flutter/material.dart';

class PrimeiraPagina extends StatefulWidget {
  const PrimeiraPagina({super.key});

  @override
  State<PrimeiraPagina> createState() => _PrimeiraPaginaState();
}

class _PrimeiraPaginaState extends State<PrimeiraPagina> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Home"));
  }
}
