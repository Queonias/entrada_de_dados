import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Map> _recuperarPreco() async {
    var httpsUri =
        Uri(scheme: 'https', host: 'blockchain.info', path: 'ticker');
    http.Response response = await http.get(httpsUri);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _recuperarPreco(),
      builder: (context, snapshot) {
        String resultado = "";

        switch (snapshot.connectionState) {
          case ConnectionState.none: // none -> estado da conexão nulo
          case ConnectionState.waiting:
            resultado = "Carregando...";
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasError) {
              resultado = "Erro ao carregar os dados.";
            } else {
              double valor = snapshot.data?["BRL"]["buy"];
              resultado = "Preço do bitcoin: ${valor.toString()}";
            }
            break;
        }
        return Center(
          child: Text(resultado),
        );
      },
    );
  }
}
