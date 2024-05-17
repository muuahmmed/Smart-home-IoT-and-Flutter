import 'package:flutter/material.dart';

import 'mqtt.dart';


class MQTTControlPage extends StatefulWidget {
  const MQTTControlPage({super.key});

  @override
  _MQTTControlPageState createState() => _MQTTControlPageState();
}

class _MQTTControlPageState extends State<MQTTControlPage> {
  late MQTTManager mqttManager;

  @override
  void initState() {
    super.initState();
    mqttManager = MQTTManager(
      server: '192.168.137.1',
      topic: 'home/photoresistor',
      clientIdentifier: 'Flutter11',
    );
    _connectToMQTT();
  }

  Future<void> _connectToMQTT() async {
    try {
      await mqttManager.connect();
    } catch (e) {
      // Handle connection failure
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MQTT LED Controller"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
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
    } catch (e) {
      // Handle publish failure
    }
  }

  @override
  void dispose() {
    mqttManager.disconnect();
    super.dispose();
  }
}
