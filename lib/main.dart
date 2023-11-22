import 'package:entrada_dados/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Verifique se este arquivo contém as opções corretas do Firebase
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Move a operação de escrita para um local apropriado no seu app, não na função main
    _adicionarUsuario();

    return const MaterialApp(
      home: Home(),
    );
  }

  Future<void> _adicionarUsuario() async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    // Adicionando Usuário
    //   try {
    //     await db
    //         .collection("usuarios")
    //         .doc("001")
    //         .set({"nome": "Queonias", "idade": "31"});
    //     print("Documento adicionado com sucesso!");
    //   } catch (e) {
    //     print("Erro ao adicionar documento: $e");
    //   }
    // }

    // Adicionando usuário com nº do documento variável
    //   try {
    //     DocumentReference ref = await db.collection("noticias").add({
    //       "titilo": "criada nova moeda virtual",
    //       "descricao": "texto exemplo"
    //     });
    //     print("item salvo ${ref.id} ");
    //   } catch (e) {
    //     print("Erro ao adicionar documento: $e");
    //   }
    // }

    //  Auterando documento
    //   try {
    //     await db.collection("noticias").doc("FFWw3c69ERlN2FiOAMdf").set({
    //       "descricao": "Ondas de calor",
    //       "titilo": "Tá muito quente aqui eu tô morrendo de calor, c",
    //     });
    //     print("item salvo");
    //   } catch (e) {
    //     print("Erro ao adicionar documento: $e");
    //   }
    // }

    //  Auterando documento
    // try {
    //   await db.collection("usuarios").doc("001").delete();
    //   print("item deletado");
    // } catch (e) {
    //   print("Erro ao adicionar documento: $e");
    // }

    // Recuperando usuário
    // DocumentSnapshot snapshot =
    //     await db.collection("usuarios").doc("002").get();

    // if (snapshot.exists) {
    //   Map<String, dynamic>? dados = snapshot.data() as Map<String, dynamic>?;
    //   if (dados != null) {
    //     print("Dados: ${dados['nome']}");
    //   } else {
    //     print('Dados é nulo ou não é um Map<String, dynamic>');
    //   }
    // } else {
    //   print('Documento não encontrado');
    // }

    // Recuperando Lista completa
    //   try {
    //     QuerySnapshot querySnapshot = await db.collection('usuarios').get();

    //     if (querySnapshot.docs.isNotEmpty) {
    //       // Iterando por todos os documentos da coleção
    //       querySnapshot.docs.forEach((document) {
    //         Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    //         print('ID do documento: ${document.id}');
    //         print('Dados: $data');
    //         // Aqui você pode fazer o que quiser com os dados de cada documento
    //       });
    //     } else {
    //       print('Nenhum documento encontrado na coleção "usuarios".');
    //     }
    //   } catch (e) {
    //     print('Erro ao buscar documentos: $e');
    //   }

    // escutando o db para avisar ao atualizar o banco

    try {
      var collection = db.collection('usuarios');
      var subscription =
          collection.snapshots().listen((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((document) {
          print("Dados: ${document.data()}");
        });
      });

      // Para cancelar a assinatura do stream quando não precisar mais
      // subscription.cancel();
    } catch (e) {
      print('Erro ao buscar documentos: $e');
    }
  }
}
