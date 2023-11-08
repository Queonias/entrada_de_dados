import 'package:flutter/material.dart';

class EntradaSwitch extends StatefulWidget {
  const EntradaSwitch({super.key});

  @override
  State<EntradaSwitch> createState() => _EntradaSwitchState();
}

class _EntradaSwitchState extends State<EntradaSwitch> {
  bool _escolhaUsuario = false;
  bool _escolhaImagens = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrada Switch"),
      ),
      body: Column(
        children: [
          // Switch(
          //   value: _escolhaUsuario,
          //   onChanged: (value) {
          //     setState(() {
          //       _escolhaUsuario = value;
          //     });
          //   },
          // ),
          // const Text("Receber notificação"),

          SwitchListTile(
            title: const Text("Receber notificação"),
            value: _escolhaUsuario,
            onChanged: (value) {
              setState(() {
                _escolhaUsuario = value;
              });
            },
          ),

          SwitchListTile(
            title: const Text("Carregar imagens automaticamente"),
            value: _escolhaImagens,
            onChanged: (value) {
              setState(() {
                _escolhaImagens = value;
              });
            },
          ),

          ElevatedButton(
              onPressed: () {
                print(_escolhaUsuario.toString() +
                    " " +
                    _escolhaImagens.toString());
              },
              child: const Text("Salvar"))
        ],
      ),
    );
  }
}
