import 'package:entrada_dados/custom_search_delegate.dart';
import 'package:entrada_dados/telas/biblioteca.dart';
import 'package:entrada_dados/telas/em_elta.dart';
import 'package:entrada_dados/telas/inicio.dart';
import 'package:entrada_dados/telas/inscricoes.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      const Inicio(),
      const EmAlta(),
      const Inscricoes(),
      const Biblioteca(),
    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.grey, opacity: 1),
        title: Image.asset(
          "imagens/youtube.png",
          width: 98,
          height: 22,
        ),
        backgroundColor: Colors.white,
        actions: [
          // IconButton(
          //     onPressed: () {
          //       print("ação: pesquisa");
          //     },
          //     icon: const Icon(Icons.search)),
          // IconButton(
          //     onPressed: () {
          //       print("ação: pesquisa");
          //     },
          //     icon: const Icon(Icons.account_circle))
          IconButton(
              onPressed: () async {
                String? res = await showSearch(
                    context: context, delegate: CustomSearchDelegate());
                print("Resultado digitado: $res");
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indiceAtual,
          onTap: (value) {
            setState(() {
              _indiceAtual = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red,
          items: const [
            BottomNavigationBarItem(
              // backgroundColor: Colors.orange,
              label: "Início",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              // backgroundColor: Colors.red,
              label: "Em alta",
              icon: Icon(Icons.whatshot),
            ),
            BottomNavigationBarItem(
              // backgroundColor: Colors.blue,
              label: "Inscrições",
              icon: Icon(Icons.subscriptions),
            ),
            BottomNavigationBarItem(
              // backgroundColor: Colors.green,
              label: "Biblioteca",
              icon: Icon(Icons.folder),
            ),
          ]),
    );
  }
}
