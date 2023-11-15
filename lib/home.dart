import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _textoSalvo = "Nada salvo!";
  final myController = TextEditingController();

  _handleSalvar() async {
    String volorDigitado = myController.text;

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("nome", volorDigitado);

    print("Salvo");
  }

  _handleLer() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _textoSalvo = prefs.getString("nome") ?? 'Sem valor';
    });

    print("lido");
  }

  _handleRemover() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.remove("nome");

    setState(() {
      _textoSalvo = 'Sem valor';
    });

    print("removido");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Manipulação de Dados"),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(_textoSalvo),
              TextField(
                decoration: const InputDecoration(labelText: "Digite algo"),
                controller: myController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: _handleSalvar, child: const Text("Salvar")),
                  ElevatedButton(
                      onPressed: _handleLer, child: const Text("Ler")),
                  ElevatedButton(
                      onPressed: _handleRemover, child: const Text("Remover")),
                ],
              )
            ],
          ),
        ));
  }
}
