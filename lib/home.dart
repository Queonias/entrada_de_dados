import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _abrirEmpresa() {
    print("Abrir Empresa");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("ATM Consultoria"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage("imagens/logo.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: _abrirEmpresa,
                    child: const Image(
                        image: AssetImage("imagens/menu_empresa.png")),
                  ),
                  GestureDetector(
                    onTap: null,
                    child: const Image(
                        image: AssetImage("imagens/menu_servico.png")),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: null,
                    child: const Image(
                      image: AssetImage("imagens/menu_cliente.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: null,
                    child: const Image(
                      image: AssetImage("imagens/menu_contato.png"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
