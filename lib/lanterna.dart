import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

class TorchWidget extends StatefulWidget {
  const TorchWidget({super.key});

  @override
  _TorchWidgetState createState() => _TorchWidgetState();
}

class _TorchWidgetState extends State<TorchWidget> {
  final controller = TorchController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool?>(
      future: controller.isTorchActive,
      builder: (_, snapshot) {
        final snapshotData = snapshot.data ?? false;

        if (snapshot.connectionState == ConnectionState.done) {
          return snapshotData
              ? ElevatedButton(
                  child: const Icon(Icons.flash_on),
                  onPressed: () {
                    // Desligar a lanterna
                    controller.toggle(intensity: 1);
                    setState(() {});
                  },
                )
              : ElevatedButton(
                  child: const Icon(Icons.flash_off),
                  onPressed: () {
                    // Ligar a lanterna com intensidade máxima e mostrar uma notificação personalizada
                    controller.toggle(
                      intensity: 1,
                      // notificationConfig: NotificationConfig(
                      //   title: 'Lanterna ligada',
                      //   content: 'Toque para abrir o aplicativo',
                      //   icon: 'drawable/smile',
                      //   channelName: 'Lanterna',
                      //   channelDescription: 'Notificação da lanterna',
                      //   channelImportance: NotificationChannelImportance.HIGH,
                      //   priority: NotificationPriority.HIGH,
                      // ),
                    );
                    setState(() {});
                  },
                );
        }

        return Container();
      },
    );
  }
}
