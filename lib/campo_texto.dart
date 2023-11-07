import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({super.key});

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  final myController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();

  //   // Começa a ouvir as mudanças.
  //   myController.addListener();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrada de dados"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: "Digite um valor"),
              enabled: true,
              maxLength: 10,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.green,
              ),
              obscureText: true,
              controller: myController,
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.lightGreen),
              textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(color: Colors.white),
              ),
            ),
            onPressed: () {
              print(myController.text);
            },
            child: const Text("Salvar"),
          )
        ],
      ),
    );
  }
}
