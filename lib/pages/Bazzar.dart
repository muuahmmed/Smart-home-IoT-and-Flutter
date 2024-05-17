import 'package:flutter/material.dart';

import 'mqtt.dart';

class Bazzar extends StatefulWidget {
  const Bazzar({super.key});

  @override
  State<Bazzar> createState() => _BazzarState();
}
class _BazzarState extends State<Bazzar> {
late MQTTManager mqttManager;

@override
void initState() {
  super.initState();
  mqttManager = MQTTManager(
    server: '192.168.137.1',
    topic: 'home/Bazzar',
    clientIdentifier: 'Flutter11',
  );
  _connectToMQTT();
}

Future<void> _connectToMQTT() async {
  try {
    await mqttManager.connect();
    print('Connected to MQTT Broker');
  } catch (e) {
    print('Failed to connect to MQTT Broker: $e');
    // Handle connection failure
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("MQTT Bazzar Controller"),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(

            ),
            onPressed: () => _publishMessage("1"),
            child: const Text("Turn On"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _publishMessage("0"),
            child: const Text("Turn Off"),
          ),
        ],
      ),
    ),
  );
}

Future<void> _publishMessage(String message) async {
  try {
    mqttManager.publish(message);
    print('Published message: $message');
  } catch (e) {
    print('Failed to publish message: $e');
    // Handle publish failure
  }
}

@override
void dispose() {
  mqttManager.disconnect();
  print('Disconnected from MQTT Broker');
  super.dispose();
}
}
