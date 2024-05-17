import 'dart:async';

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MQTTManager {
  final String server;
  final String topic;
  final String clientIdentifier;

  late MqttServerClient _client;

  MQTTManager({
    required this.server,
    required this.topic,
    required this.clientIdentifier,
  }) {
    _client = MqttServerClient(server, clientIdentifier);
    _client.port = 1883; // Default MQTT port
    _client.logging(on: true);
    _client.keepAlivePeriod = 20;
    _client.onDisconnected = _onDisconnected;
    _client.onConnected = _onConnected;


  }




  Future<void> connect() async {
    try {
      await _client.connect();
    } catch (e) {
      print('Exception: $e');
      // Handle connection error
    }
  }

  void disconnect() {
    _client.disconnect();
  }

  void publish(String message) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    _client.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!);
  }

  void _onConnected() {
    print('Connected to MQTT Broker');
    // Perform any necessary actions upon connection
  }

  void _onDisconnected() {
    print('Disconnected from MQTT Broker');
    // Perform any necessary actions upon disconnection
  }
}
