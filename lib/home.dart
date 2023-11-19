import 'package:entrada_dados/primeira_pagina.dart';
import 'package:entrada_dados/segunda_pagina.dart';
import 'package:entrada_dados/terceira_pagina.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  // usa um mixin para fornecer um vsync
  late TabController _tabController; // cria um TabController

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
        length: 3,
        vsync: this,
        initialIndex:
            1); // inicializa o TabController com o número de abas e o vsync
  }

  @override
  void dispose() {
    _tabController
        .dispose(); // descarta o TabController quando o widget for destruído
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Abas"),
        bottom: TabBar(
          controller: _tabController, // passa o TabController para a TabBar
          tabs: const [
            Tab(
              text: "Home",
              icon: Icon(Icons.home),
            ),
            Tab(
              text: "Email",
              icon: Icon(Icons.email),
            ),
            Tab(
              text: "Outra",
              icon: Icon(Icons.more),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController, // passa o TabController para a TabBarView
        children: const <Widget>[
          // coloque os widgets que você quer mostrar em cada aba
          PrimeiraPagina(),
          SegundaPagina(),
          TerceiraPagina(),
        ],
      ),
    );
  }
}
