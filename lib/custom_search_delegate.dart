import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear)),
      // IconButton(
      //     onPressed: () {
      //       showSearch(context: context, delegate: CustomSearchDelegate());
      //     },
      //     icon: const Icon(Icons.done)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // Use um pequeno atraso para fechar a tela após a construção dos resultados
    Future.delayed(const Duration(milliseconds: 100), () {
      close(context, query);
    });

    return Container(
        // Aqui você constrói e exibe os resultados da pesquisa
        // Pode ser um ListView.builder, GridView.builder ou outro widget para mostrar os resultados
        );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> lista = [];

    if (query.isNotEmpty) {
      lista = ["Android", "Android navegação", "IOS", "jogos"]
          .where((element) =>
              element.toLowerCase().startsWith(query.toLowerCase()))
          .toList();

      return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              close(context, lista[index].toString());
            },
            title: Text(lista[index]),
          );
        },
      );
    } else {
      return const Center(
        child: Text("Nunhum resultado para pesquisa"),
      );
    }
  }
}
