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
  var httpsUri =
      Uri(scheme: 'https', host: 'jsonplaceholder.typicode.com', path: 'posts');

  Post post = Post(0, 0, "", "");

  Future<List<Post>> _recuperarPostagens() async {
    http.Response response = await http.get(httpsUri);
    var dadosJson = json.decode(response.body);

    List<Post> postagens = [];
    for (var post in dadosJson) {
      postagens
          .add(Post(post["userId"], post["id"], post["title"], post["body"]));
    }

    return postagens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consumo de serviço avançado"),
      ),
      body: FutureBuilder<List<Post>>(
        future: _recuperarPostagens(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none: // none -> estado da conexão nulo
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasError) {
                print("lista: Erro ao carregar");
              } else {}
              print("lista: Carregou!!");
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  List<Post>? lista = snapshot.data;
                  Post post = lista?[index] ?? Post(0, 0, "", "");

                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
