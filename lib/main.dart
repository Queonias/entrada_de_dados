// import 'dart:js_interop';

import 'package:entrada_dados/lanterna.dart';
import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

void main() {
  TorchController().initialize();
  runApp(const MaterialApp(
    home: TorchWidget(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = TorchController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          color: const Color.fromARGB(255, 0, 3, 56),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FutureBuilder<bool?>(
                  future: controller.isTorchActive,
                  builder: (_, snapshot) {
                    final snapshotData = snapshot.data ?? false;

                    if (snapshot.connectionState == ConnectionState.done) {
                      return snapshotData
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 100,
                                shadowColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(200)),
                                ),
                              ),
                              child:
                                  const Icon(Icons.power_settings_new_rounded),
                              onPressed: () {
                                controller.toggle(intensity: 1);
                                setState(() {});
                              },
                            )
                          : ElevatedButton(
                              child:
                                  const Icon(Icons.power_settings_new_rounded),
                              onPressed: () {
                                controller.toggle(intensity: 1);
                                setState(() {});
                              },
                            );
                    }

                    return Container();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
