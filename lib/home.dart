import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: const Text("Conteúdo"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 6,
        icon: const Icon(Icons.add_shopping_cart), // extended
        label: const Text("Adcionar"), onPressed: () {}, //extended
        // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)), //extended
        // mini: true, // centerDocked
        // child: const Icon(Icons.add), //centerDocked
        // onPressed: () {
        //   print("Resultado: Botão pressionado"); //centerDocked
        // },
      ),
      bottomNavigationBar: BottomAppBar(
        // shape: const CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
          ],
        ),
      ),
    );
  }
}
