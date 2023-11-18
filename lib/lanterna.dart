// import 'package:flutter/material.dart';
// import 'package:torch_controller/torch_controller.dart';
// import 'dart:async';

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final controller = TorchController();
//   double _valorSelecionado = 0;
//   bool _piscar = false;
//   Timer? _timer;
//   bool luzLigada = false;
//   bool buttonOffON = false;

//   void atualizarValorSlider(double novoValor) {
//     setState(() {
//       _valorSelecionado = novoValor;
//       _piscar = _valorSelecionado > 0;
//     });
//     alternarRetorno();
//     estaAtiva();
//   }

//   Future<void> estaAtiva() async {
//     bool? isTorchActive = await controller.isTorchActive;
//     setState(() {
//       luzLigada = isTorchActive ?? false;
//       // print(luzLigada.toString());
//     });
//   }

//   void alternarRetorno() async {
//     if (_timer != null && _timer!.isActive) {
//       _timer!.cancel();
//     }
//     // print("entrei no alternarRetorno");

//     if (_piscar) {
//       _timer = Timer.periodic(
//         Duration(milliseconds: (520 - _valorSelecionado * 50).toInt()),
//         (timer) {
//           controller.toggle();
//         },
//       );
//     }

//     if (!_piscar) {
//       _timer!.cancel();
//       await estaAtiva();
//       if (!luzLigada) {
//         controller.toggle();
//       }
//     }
//   }

//   @override
//   void dispose() {
//     if (_timer != null && _timer!.isActive) {
//       _timer!.cancel();
//     }
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           width: double.infinity,
//           padding: const EdgeInsets.all(16),
//           color: const Color.fromARGB(255, 0, 3, 56),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               FutureBuilder<bool?>(
//                 future: controller.isTorchActive,
//                 builder: (_, snapshot) {
//                   final snapshotData = snapshot.data ?? false;

//                   if (snapshot.connectionState == ConnectionState.done) {
//                     return snapshotData
//                         ? ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               padding: const EdgeInsets.all(30),
//                               elevation: 50,
//                               shadowColor:
//                                   const Color.fromARGB(255, 255, 255, 255),
//                               shape: const RoundedRectangleBorder(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(200)),
//                               ),
//                             ),
//                             child: const Icon(
//                               Icons.lightbulb_rounded,
//                               color: Color.fromARGB(255, 221, 255, 0),
//                             ),
//                             onPressed: () async {
//                               if (_piscar &&
//                                   _timer != null &&
//                                   _timer!.isActive) {
//                                 _timer!.cancel();
//                               }
//                               await estaAtiva();
//                               if (luzLigada) {
//                                 await controller.toggle();
//                               }
//                               setState(() {
//                                 luzLigada = false;
//                                 buttonOffON = false;
//                               });
//                             },
//                           )
//                         : ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               padding: const EdgeInsets.all(30),
//                               shape: const RoundedRectangleBorder(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(200)),
//                               ),
//                             ),
//                             child: const Icon(Icons.lightbulb_outlined,
//                                 color: Color.fromARGB(255, 221, 255, 0)),
//                             onPressed: () async {
//                               await estaAtiva();
//                               if (!luzLigada) {
//                                 await controller.toggle();
//                               }
//                               setState(() {
//                                 luzLigada = true;
//                                 buttonOffON = true;
//                               });
//                               atualizarValorSlider(_valorSelecionado);
//                             },
//                           );
//                   }

//                   return Container();
//                 },
//               ),
//               RotatedBox(
//                 quarterTurns: 0,
//                 child: Column(
//                   children: [
//                     Slider(
//                       // overlayColor: Colors.yellow,
//                       secondaryActiveColor: Colors.yellow,
//                       activeColor: Colors.yellow,
//                       value: _valorSelecionado,
//                       min: 0,
//                       max: 10,
//                       // divisions: 10,
//                       label: '$_valorSelecionado',
//                       onChanged: buttonOffON
//                           ? (novoValor) {
//                               atualizarValorSlider(novoValor);
//                             }
//                           : null,
//                     ),
//                     const Text(
//                       "Velocidade",
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 152, 175, 0),
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
