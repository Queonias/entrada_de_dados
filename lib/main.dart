// import 'package:entrada_dados/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Verifique se este arquivo contém as opções corretas do Firebase
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Registration Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegistrationScreen(),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _registerUser() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Usuário cadastrado com sucesso
      print('Usuário cadastrado: ${userCredential.user!.email}');

      // Aqui você pode fazer outras operações após o cadastro
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('A senha é muito fraca.');
      } else if (e.code == 'email-already-in-use') {
        print('O e-mail já está em uso por outra conta.');
      } else {
        print('Erro ao cadastrar usuário: ${e.message}');
      }
    } catch (e) {
      print('Erro inesperado ao cadastrar usuário: $e');
    }
  }

  Future<void> _isUserLoggedIn() async {
    User? usuarioAtual = _auth.currentUser;
    if (usuarioAtual != null) {
      print('Usuário logado: ${usuarioAtual.email}');
    } else {
      print('Usuário deslogado');
    }
  }

  Future<void> _singOut() async {
    try {
      User? usuarioAtual = _auth.currentUser;
      if (usuarioAtual != null) {
        _auth.signOut();
        print('Usuário desconectado com sucesso');
      } else {
        print('Nenhum usuário logado');
      }
    } catch (e) {
      print('Erro ao desconectar o usuário: $e');
    }
  }

  Future<void> _signIn() async {
    try {
      User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        print('Usuário já conectado. Ir para a tela home.');
      } else {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        print(
            'Usuário conectado. Ir para a tela home: ${userCredential.user!.email}');
      }
    } catch (e) {
      print('Erro ao logar o usuário: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _registerUser,
              child: const Text('Register'),
            ),
            ElevatedButton(
                onPressed: _isUserLoggedIn, child: const Text("Esta logado")),
            ElevatedButton(
                onPressed: _singOut, child: const Text("Deslogar Usuário")),
            ElevatedButton(
                onPressed: _signIn, child: const Text("Logar usuário")),
          ],
        ),
      ),
    );
  }
}
