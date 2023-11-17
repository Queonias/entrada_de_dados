import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _recuperaBancoDados() async {
    try {
      final caminhoBancoDados = await getDatabasesPath();
      final localBancoDados = join(caminhoBancoDados, "banco.db");

      var bd = await openDatabase(
        localBancoDados,
        version: 2, // aumentar o número da versão
        onCreate: (db, version) {
          String sql =
              "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER)";

          db.execute(sql);
        },
        onUpgrade: (db, oldVersion, newVersion) async {
          // apagar a tabela antiga se existir
          await db.execute("DROP TABLE IF EXISTS usuarios");
          // criar a tabela nova
          String sql =
              "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER)";

          db.execute(sql);
        },
        onOpen: (db) async {
          print("Banco de dados aberto: ${db.path}");
          print("Versão do banco de dados: ${await db.getVersion()}");
        },
      );

      return bd;
    } catch (e) {
      print("Abrir banco: $e");
      return null;
    }
  }

  _salvar() async {
    try {
      Database? bd =
          await _recuperaBancoDados(); // usar o operador ? para indicar que a variável pode ser nula

      if (bd != null) {
        // verificar se o banco de dados não é nulo
        Map<String, dynamic> dadosUsuario = {
          "nome": "Beatriz de Souza",
          "idade": 19
        };

        int id = await bd.insert("usuarios", dadosUsuario);
        print("Salvo: $id");
      } else {
        print("Banco de dados nulo");
      }
    } catch (e) {
      print(e);
    }
  }

  _listarUsuarios() async {
    Database bd = await _recuperaBancoDados();

    String sql = "SELECT * FROM usuarios";

    List usuarios = await bd.rawQuery(sql);

    for (var usuario in usuarios) {
      print("item id : ${usuario["id"]}");
      print("item nome : ${usuario["nome"]}");
      print("item idade : ${usuario["idade"]}");
    }

    print(usuarios);
  }

  _recuperarUsuarioPeloId(int id) async {
    Database bd = await _recuperaBancoDados();
    List usuarios = await bd.query("usuarios",
        columns: ["id", 'nome', 'idade'], where: "id = ?", whereArgs: [id]);

    for (var usuario in usuarios) {
      print("item id : ${usuario["id"]}");
      print("item nome : ${usuario["nome"]}");
      print("item idade : ${usuario["idade"]}");
    }
  }

  _excluirUsuario(int id) async {
    Database bd = await _recuperaBancoDados();

    int retorno = await bd.delete("usuarios", where: "id = ?", whereArgs: [id]);

    print("item removido qtde: $retorno");
  }

  _atualizarUsuario(int id) async {
    Database bd = await _recuperaBancoDados();

    Map<String, dynamic> dadosUsuario = {
      "nome": "Renado Duarte",
      "idade": 26,
    };

    int retorno = await bd
        .update("usuarios", dadosUsuario, where: "id = ?", whereArgs: [id]);

    print("item atualizado qtde: $retorno");
  }

  @override
  Widget build(BuildContext context) {
    // _recuperaBancoDados();
    // _salvar();
    _listarUsuarios();
    // _recuperarUsuarioPeloId(7);
    // _atualizarUsuario(7);
    // _recuperarUsuarioPeloId(7);
    // _excluirUsuario(6);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
    );
  }
}
