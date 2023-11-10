import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _precoBitcoin = '0';

  getRequest() async {
    var httpsUri =
        Uri(scheme: 'https', host: 'blockchain.info', path: 'ticker');
    try {
      http.Response res;
      // print(url);
      res = await http.get(httpsUri);
      Map<String, dynamic> result = json.decode(res.body);
      setState(() {
        _precoBitcoin = result["BRL"]["buy"].toString();
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage("imagens/bitcoin.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 32),
              child: Text(
                "R\$ $_precoBitcoin",
                style: const TextStyle(
                    color: Colors.black,
                    // fontWeight: FontWeight.bold,
                    fontSize: 32),
              ),
            ),
            ElevatedButton(
                onPressed: getRequest,
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    backgroundColor: const Color.fromARGB(255, 255, 164, 37)),
                child: const Text(
                  "Atualizar",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
