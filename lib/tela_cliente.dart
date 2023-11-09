import 'package:flutter/material.dart';

class TelaCliente extends StatefulWidget {
  const TelaCliente({super.key});

  @override
  State<TelaCliente> createState() => _TelaClienteState();
}

class _TelaClienteState extends State<TelaCliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cliente"),
        backgroundColor: const Color.fromARGB(255, 121, 149, 76),
      ),
      body: SingleChildScrollView(
        child: Container(
          // width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: const Column(
            children: [
              Row(
                children: [
                  Image(image: AssetImage("imagens/detalhe_cliente.png")),
                  Text(
                    "Nossos Clientes",
                    style: TextStyle(
                        color: Color.fromARGB(255, 121, 149, 76),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Consectetur adipiscing elit. Etiam quis gravida mi, a maximus velit.",
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
