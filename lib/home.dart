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
          "nome": "Queonias Gama Rocha",
          "idade": 32
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

  @override
  Widget build(BuildContext context) {
    // _recuperaBancoDados();
    _salvar();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
    );
  }
}
