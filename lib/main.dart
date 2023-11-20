import 'package:entrada_dados/lanterna.dart';
import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

void main() {
  TorchController().initialize();
  runApp(const MaterialApp(
    home: Lanterna(),
  ));
}
