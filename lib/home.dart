import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Map<String, dynamic> res = {};

  _recuperarCEP() async {
    String cep = "01001000";
    var httpsUri = Uri(
      scheme: 'https',
      host: 'viacep.com.br',
      path: '/ws/$cep/json/',
    );

    try {
      http.Response response;
      response = await http.get(httpsUri);
      print("resposta: ${response.body}");
      setState(() {
        res = json.decode(response.body);
      });
    } catch (e) {
      print("Mensagem de error: $e");
    }
  }

  String _lagradouro() {
    if (res.containsKey("logradouro")) {
      return "Logradouro: ${res["logradouro"]}";
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consumo de Serviço"),
      ),
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  _lagradouro(),
                )
              ],
            ),
            ElevatedButton(
                onPressed: _recuperarCEP, child: const Text("Clique aqui"))
          ],
        ),
      ),
    );
  }
}
