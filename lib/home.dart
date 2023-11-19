import 'package:entrada_dados/views/bichos.dart';
import 'package:entrada_dados/views/numeros.dart';
import 'package:entrada_dados/views/vogais.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Aprenda Inglês"),
          backgroundColor: Colors.brown,
          bottom: TabBar(
              indicatorWeight: 4,
              indicatorColor: Colors.white,
              labelStyle:
                  const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              controller: _tabController,
              tabs: const [
                Tab(
                  text: "Bichos",
                ),
                Tab(
                  text: "Números",
                ),
                Tab(
                  text: "Vogais",
                ),
              ]),
        ),
        body: TabBarView(controller: _tabController, children: const [
          Bichos(),
          Numeros(),
          Vogais(),
        ]));
  }
}
