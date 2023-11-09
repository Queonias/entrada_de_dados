import 'package:flutter/material.dart';

class TelaServico extends StatefulWidget {
  const TelaServico({super.key});

  @override
  State<TelaServico> createState() => _TelaServicoState();
}

class _TelaServicoState extends State<TelaServico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Serviços"),
        backgroundColor: const Color.fromARGB(255, 37, 200, 203),
      ),
      body: SingleChildScrollView(
        child: Container(
          // width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: const Column(
            children: [
              Row(
                children: [
                  Image(image: AssetImage("imagens/detalhe_servico.png")),
                  Text(
                    "Nossos Serviços",
                    style: TextStyle(
                        color: Color.fromARGB(255, 37, 200, 203),
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
