import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _listaTarefas = [];
  Map<String, dynamic> _ultimaTarefaRemovido = {};
  final TextEditingController _controllerTarefa = TextEditingController();

  Future<File> _getFile() async {
    final diretorio = await getApplicationCacheDirectory();
    return File("${diretorio.path}/dados.json");
  }

  _salvarArquivo() async {
    var arquivo = await _getFile();

    String dados = json.encode(_listaTarefas);
    arquivo.writeAsString(dados);
  }

  _lerArquivo() async {
    try {
      final arquivo = await _getFile();
      return arquivo.readAsString();
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  _salvarTarefa() {
    String textoDigitado = _controllerTarefa.text;

    Map<String, dynamic> tarefa = {};
    tarefa["titulo"] = textoDigitado;
    tarefa["realizada"] = false;
    setState(() {
      _listaTarefas.add(tarefa);
    });

    _salvarArquivo();

    _controllerTarefa.text = "";
  }

  @override
  void initState() {
    super.initState();

    _lerArquivo().then((dados) {
      setState(() {
        _listaTarefas = json.decode(dados);
      });
    });
  }

  Widget criarItemLista(context, index) {
    final item = DateTime.now().microsecondsSinceEpoch.toString();
    return Dismissible(
      direction: DismissDirection.endToStart,
      background: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.red,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.delete,
              color: Colors.white,
            )
          ],
        ),
      ),
      key: Key(item),
      child: CheckboxListTile(
        value: _listaTarefas[index]["realizada"],
        title: Text(_listaTarefas[index]["titulo"].toString()),
        onChanged: (value) {
          setState(() {
            _listaTarefas[index]["realizada"] = value;
          });
          _salvarArquivo();
        },
      ),
      onDismissed: (direction) {
        _ultimaTarefaRemovido = _listaTarefas[index];
        _listaTarefas.removeAt(index);
        _salvarArquivo();

        var snackbar = SnackBar(
          duration: const Duration(seconds: 5),
          action: SnackBarAction(
            label: 'Desfazer',
            onPressed: () {
              setState(() {
                _listaTarefas.insert(index, _ultimaTarefaRemovido);
              });
              _salvarArquivo();
            },
          ),
          content: const Text("Tarefa Removida"),
          backgroundColor: Colors.green,
        );

        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      },
    );
  }

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
                  controller: _controllerTarefa,
                  decoration:
                      const InputDecoration(labelText: "Digite sua tarefa"),
                  onChanged: (value) {},
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        _salvarTarefa();
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
              itemBuilder: criarItemLista,
            ),
          ),
        ],
      ),
    );
  }
}
