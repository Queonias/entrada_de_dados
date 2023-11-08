import 'package:flutter/material.dart';

class EntradaRadioButton extends StatefulWidget {
  const EntradaRadioButton({super.key});

  @override
  State<EntradaRadioButton> createState() => _EntradaRadioButtonState();
}

class _EntradaRadioButtonState extends State<EntradaRadioButton> {
  String _character = "M";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Radio Button"),
      ),
      body: Column(
        children: [
          // const Text("Masculino"),
          // Radio(
          //   value: "M",
          //   groupValue: _escolhaUsuario,
          //   onChanged: (value) {
          //     setState(() {
          //       _escolhaUsuario = value!;
          //     });
          //   },
          // ),
          // const Text("Feminino"),
          // Radio(
          //   value: "F",
          //   groupValue: _escolhaUsuario,
          //   onChanged: (value) {
          //     setState(() {
          //       _escolhaUsuario = value!;
          //     });

          //   },
          // ),

          RadioListTile(
            title: const Text('Masculino'),
            value: "M",
            groupValue: _character,
            onChanged: (value) {
              setState(() {
                _character = value!;
              });
            },
          ),
          RadioListTile(
            title: const Text('Feminino'),
            value: "F",
            groupValue: _character,
            onChanged: (value) {
              setState(() {
                _character = value!;
              });
            },
          ),
          ElevatedButton(
              onPressed: () {
                print(_character);
              },
              child: const Text("Salvar"))
        ],
      ),
    );
  }
}
