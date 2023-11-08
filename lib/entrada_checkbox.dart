import 'package:flutter/material.dart';

class EntradaCheckbox extends StatefulWidget {
  const EntradaCheckbox({super.key});

  @override
  State<EntradaCheckbox> createState() => _EntradaCheckboxState();
}

class _EntradaCheckboxState extends State<EntradaCheckbox> {
  bool _isChecketBrasileira = false;
  bool _isChecketMexicana = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrada de dados"),
      ),
      body: Container(
        child: Column(
          children: [
            CheckboxListTile(
              title: const Text("Comida brasileira"),
              subtitle: const Text("A melhor comida do mundo"),
              activeColor: Colors.green,
              selected: _isChecketBrasileira,
              value: _isChecketBrasileira,
              secondary: const Icon(Icons.add_box),
              onChanged: (value) {
                setState(() {
                  _isChecketBrasileira = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Comida mexicana"),
              subtitle: const Text("A melhor comida do mundo"),
              activeColor: Colors.green,
              selected: _isChecketMexicana,
              value: _isChecketMexicana,
              secondary: const Icon(Icons.add_box),
              onChanged: (value) {
                setState(() {
                  _isChecketMexicana = value!;
                });
              },
            ),

            const ElevatedButton(
              onPressed: null,
              child: Text(
                "Salvar",
                style: TextStyle(fontSize: 20),
              ),
            )

            // const Text("Comida brasileira"),
            // Checkbox(
            //   value: _isChecket,
            //   onChanged: (value) {
            //     setState(() {
            //       _isChecket = value!;
            //     });
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
