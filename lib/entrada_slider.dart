import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EntradaSlider extends StatefulWidget {
  const EntradaSlider({super.key});

  @override
  State<EntradaSlider> createState() => _EntradaSliderState();
}

class _EntradaSliderState extends State<EntradaSlider> {
  double valor = 0;
  String label = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Slider"),
        ),
        body: Container(
          padding: const EdgeInsets.all(60),
          child: Column(
            children: [
              Slider(
                value: valor,
                min: 0,
                max: 10,
                label: label,
                divisions: 10,
                activeColor: Colors.amber,
                inactiveColor: Colors.blueGrey,
                onChanged: (value) {
                  setState(() {
                    valor = value;
                    label = "$value";
                  });
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    print(valor);
                  },
                  child: Text("Salvar")),
            ],
          ),
        ));
  }
}
