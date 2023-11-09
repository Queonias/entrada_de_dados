import 'package:flutter/material.dart';

class TelaEmpresa extends StatefulWidget {
  const TelaEmpresa({super.key});

  @override
  State<TelaEmpresa> createState() => _TelaEmpresaState();
}

class _TelaEmpresaState extends State<TelaEmpresa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Empresa"),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Container(
          // width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: const Column(
            children: [
              Row(
                children: [
                  Image(image: AssetImage("imagens/detalhe_empresa.png")),
                  Text(
                    "Sobre a Empresa",
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis gravida mi, a maximus velit. Suspendisse dictum, velit ut imperdiet dictum, velit dui commodo nulla, nec ullamcorper mauris ante ut felis. Duis ipsum risus, posuere non ligula dictum, venenatis convallis tortor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sodales porttitor nibh eu dignissim. Vivamus vulputate fermentum efficitur. Phasellus lobortis enim vitae gravida consequat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse luctus iaculis quam, ut maximus nibh. Aliquam mollis interdum ligula at dictum. Proin tempus quis felis eu tristique. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Phasellus luctus accumsan magna. Nullam tristique sollicitudin felis ut iaculis. Donec volutpat condimentum nibh ac auctor.",
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis gravida mi, a maximus velit. Suspendisse dictum, velit ut imperdiet dictum, velit dui commodo nulla, nec ullamcorper mauris ante ut felis. Duis ipsum risus, posuere non ligula dictum, venenatis convallis tortor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sodales porttitor nibh eu dignissim. Vivamus vulputate fermentum efficitur. Phasellus lobortis enim vitae gravida consequat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse luctus iaculis quam, ut maximus nibh. Aliquam mollis interdum ligula at dictum. Proin tempus quis felis eu tristique. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Phasellus luctus accumsan magna. Nullam tristique sollicitudin felis ut iaculis. Donec volutpat condimentum nibh ac auctor.",
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
