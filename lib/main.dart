// import 'package:entrada_dados/firebase_app_check_example.dart';
import 'package:entrada_dados/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'firebase_options.dart';

const kWebRecaptchaSiteKey = 'AIzaSyBEkx4hgsMF72PaCLH0IRZLmLlGmrWjMWw';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Adicione esta linha para inicializar o App Check
  await FirebaseAppCheck.instance
      // Your personal reCaptcha public key goes here:
      .activate(
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.debug,
    webProvider: ReCaptchaV3Provider(kWebRecaptchaSiteKey),
  );

  runApp(const MaterialApp(
    home: Home(),
    // home: FirebaseAppCheckExample(title: 'Firebase App Check'),
  ));
}
