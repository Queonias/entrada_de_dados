import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List _listaTarefas = ["Ir ao mercado", "Estudar", "Tomar banho"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de tarefas"),
        backgroundColor: Colors.deepPurple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Adcionar tarefa"),
                content: TextField(
                  decoration:
                      const InputDecoration(labelText: "Digite sua tarefa"),
                  onChanged: (value) {},
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Salvar")),
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancelar"))
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _listaTarefas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_listaTarefas[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
