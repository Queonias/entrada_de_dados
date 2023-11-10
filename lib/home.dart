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
    String cepDigitado = _controllerCEP.text;
    String cep = cepDigitado;
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
      return "${res["logradouro"]}, ${res["bairro"]} ${res["localidade"]} - ${res["uf"]}";
    } else {
      return "";
    }
  }

  final TextEditingController _controllerCEP = TextEditingController();

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
            TextField(
              keyboardType: TextInputType.number,
              // const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                  labelText: "Digite o CEP: ex: 05428200"),
              style: const TextStyle(fontSize: 20),
              controller: _controllerCEP,
            ),
            ElevatedButton(
              onPressed: _recuperarCEP,
              child: const Text("Clique aqui"),
            ),
            Text(
              _lagradouro(),
            ),
          ],
        ),
      ),
    );
  }
}
