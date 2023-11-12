import 'dart:convert';
import 'package:entrada_dados/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Uri httpsUri = Uri(
    scheme: 'https',
    host: 'jsonplaceholder.typicode.com',
    path: 'posts',
  );

  Future<List<Post>> _requestPost() async {
    final response = await http.get(httpsUri);
    final List<dynamic> dadosJson = json.decode(response.body);

    return dadosJson
        .map((post) => Post(
              post["userId"],
              post["id"],
              post["title"],
              post["body"],
            ))
        .toList();
  }

  _post() async {
    Post post = Post(120, null, "eum et est occaecati", "ullam et sae");
    var corpo = json.encode(post.toJson());
    http.Response response = await http.post(
        Uri(
          scheme: 'https',
          host: 'jsonplaceholder.typicode.com',
          path: 'posts',
        ),
        headers: {'Content-type': 'application/json; charset=UTF-8'},
        body: corpo);

    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }

  _put() async {
    Post post = Post(120, null, "Título alterado", "Alterado");
    var corpo = json.encode(post.toJson());
    http.Response response = await http.put(
        Uri(
          scheme: 'https',
          host: 'jsonplaceholder.typicode.com',
          path: 'posts/2',
        ),
        headers: {'Content-type': 'application/json; charset=UTF-8'},
        body: corpo);

    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }

  _patch() async {
    var corpo = json.encode({"userId": 120, "title": "Título alterado"});
    http.Response response = await http.patch(
        Uri(
          scheme: 'https',
          host: 'jsonplaceholder.typicode.com',
          path: 'posts/2',
        ),
        headers: {'Content-type': 'application/json; charset=UTF-8'},
        body: corpo);

    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }

  _delete() async {
    http.Response response = await http.delete(Uri(
      scheme: 'https',
      host: 'jsonplaceholder.typicode.com',
      path: 'posts/2',
    ));

    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consumo de serviços avançados"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _post,
                  child: const Text("Salvar"),
                ),
                ElevatedButton(
                  onPressed: _patch,
                  child: const Text("Atualizar"),
                ),
                ElevatedButton(
                  onPressed: _delete,
                  child: const Text("Remover"),
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder<List<Post>>(
                future: _requestPost(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    print("Lista: Erro ao carregar");
                    return const Center(
                      child: Text("Erro ao carregar dados"),
                    );
                  } else if (snapshot.data?.isEmpty ?? true) {
                    return const Center(
                      child: Text("Nenhum dado disponível"),
                    );
                  } else {
                    print("Lista: Carregou!!");
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final post = snapshot.data![index];
                        return ListTile(
                          title: Text(post.title ?? "N/A"),
                          subtitle: Text(post.body ?? "N/A"),
                        );
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
