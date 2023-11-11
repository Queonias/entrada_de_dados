import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _itens = [];

  void _carregarItens() {
    _itens = [];
    for (int i = 0; i <= 10; i++) {
      Map<String, dynamic> item = {};
      item["titulo"] = "Título $i Lorem ipsum dolor sit amet.";
      item["descricao"] = "$i Lorem ipsum dolor sit amet.";
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    _carregarItens();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: _itens.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                // print("clique com onTap $index");
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(_itens[index]["titulo"]),
                      titlePadding: const EdgeInsets.all(20),
                      titleTextStyle:
                          const TextStyle(fontSize: 20, color: Colors.orange),
                      content: Text(_itens[index]["descricao"]),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            print("Selecionado Sim");
                            Navigator.pop(context);
                          },
                          child: const Text("Sim"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            print("Selecionado Não");
                            Navigator.pop(context);
                          },
                          child: const Text("Não"),
                        )
                      ],
                      // backgroundColor: Colors.amber,
                      // contentPadding: const EdgeInsets.all(80),
                    );
                  },
                );
              },
              onLongPress: null,
              title: Text(_itens[index]["titulo"]),
              subtitle: Text(_itens[index]["descricao"]),
            );
          },
        ),
      ),
    );
  }
}
