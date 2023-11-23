import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
        title: const Text("Home"),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: _adicionarUsuario,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _adicionarUsuario() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
  }
}
