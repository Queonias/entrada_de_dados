import 'package:firebase_app_check/firebase_app_check.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// import 'firebase_options.dart';

const kWebRecaptchaSiteKey = 'AIzaSyBEkx4hgsMF72PaCLH0IRZLmLlGmrWjMWw';

class FirebaseAppCheckExample extends StatefulWidget {
  FirebaseAppCheckExample({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _FirebaseAppCheck createState() => _FirebaseAppCheck();
}

class _FirebaseAppCheck extends State<FirebaseAppCheckExample> {
  final appCheck = FirebaseAppCheck.instance;
  String _message = '';
  String _eventToken = 'not yet';

  @override
  void initState() {
    appCheck.onTokenChange.listen(setEventToken);
    super.initState();
  }

  void setMessage(String message) {
    setState(() {
      _message = message;
    });
  }

  void setEventToken(String? token) {
    setState(() {
      _eventToken = token ?? 'not yet';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                // Use este botão para verificar se a solicitação foi validada no console do Firebase
                // Obtém o primeiro documento da coleção
                final result = await FirebaseFirestore.instance
                    .collection('usuarios')
                    .limit(1)
                    .get();

                if (result.docs.isNotEmpty) {
                  setMessage('Document found');
                } else {
                  setMessage(
                    'Document not found, please add a document to the collection',
                  );
                }
              },
              child: const Text('Test App Check valida interferências'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (kIsWeb) {
                  print(
                    'Passe sua chave "webRecaptchaSiteKey" encontrada em seu Firebase Console para ativar se estiver usando na plataforma web.',
                  );
                }
                await appCheck.activate(
                  webProvider: ReCaptchaV3Provider(kWebRecaptchaSiteKey),
                );
                setMessage('activated!!');
              },
              child: const Text('activate()'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Token will be passed to `onTokenChange()` event handler
                await appCheck.getToken(true);
              },
              child: const Text('getToken()'),
            ),
            ElevatedButton(
              onPressed: () async {
                await appCheck.setTokenAutoRefreshEnabled(true);
                setMessage(
                    'configuração automática de atualização de token com sucesso!!');
              },
              child: const Text(
                  'definir atualização automática de token ativada ()()'),
            ),
            const SizedBox(height: 20),
            Text(
              _message, //#007bff
              style: const TextStyle(
                color: Color.fromRGBO(47, 79, 79, 1),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Token recebido da API tokenChanges(): $_eventToken', //#007bff
              style: const TextStyle(
                color: Color.fromRGBO(128, 0, 128, 1),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
