import 'package:entrada_dados/api.dart';
import 'package:entrada_dados/model/video.dart';
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  _listarVideos() {
    Api api = Api();

    return api.pesquisa("pesquisa");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _listarVideos(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  List<Video>? videos = snapshot.data;
                  Video video = videos![index];
                  return Column(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: NetworkImage(video.imagem),
                          fit: BoxFit.cover,
                        )),
                      ),
                      ListTile(
                        title: Text(video.titulo),
                        subtitle: Text(video.canal),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                  height: 2,
                  color: Colors.red,
                ),
                itemCount: snapshot.data!.length,
              );
            } else {
              return const Center(
                child: Text("Nenhum dado a ser exibido!"),
              );
            }
        }
      },
    );
  }
}
