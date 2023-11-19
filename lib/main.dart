import 'package:entrada_dados/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Colors.brown,
        scaffoldBackgroundColor: const Color(0xfff5e9b9)),
    home: const Home(),
  ));
}
