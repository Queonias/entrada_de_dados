import 'dart:convert';

import 'package:entrada_dados/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var httpsUri = Uri(
    scheme: 'https',
    host: 'jsonplaceholder.typicode.com',
    path: 'posts',
  );
  Future<List<Post>> _requestPost() async {
    http.Response response = await http.get(httpsUri);
    var dadosJson = json.decode(response.body);

    List<Post> postagem = [];

    for (var post in dadosJson) {
      postagem
          .add(Post(post["userId"], post["id"], post["title"], post["body"]));
    }

    return postagem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consumo de serviços avançados"),
      ),
      body: FutureBuilder<List<Post>>(
        future: _requestPost(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasError) {
                print("Lista: Error ao carregar");
              } else {
                print("Lista: Carregou!!");

                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    List<Post>? postagem = snapshot.data;
                    Post post = postagem?[index] ?? Post(0, 0, "", "");

                    return ListTile(
                      title: Text(post.title),
                      subtitle: Text(post.body),
                    );
                  },
                );
              }
              break;
          }
          // Adicionando um retorno de widget padrão para o caso de todos os ramos
          // não cobertos pelo switch
          return const Center(
            child: Text("Erro inesperado ao carregar dados"),
          );
        },
      ),
    );
  }
}
