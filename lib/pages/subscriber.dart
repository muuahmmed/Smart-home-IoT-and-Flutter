import 'dart:async';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MQTTManager {
  final String server;
  final String topic;
  final String clientIdentifier;

  late MqttServerClient _client;
  late StreamController<String> _messageStreamController;

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
    _messageStreamController = StreamController<String>.broadcast();
  }

  Stream<String> get messageStream => _messageStreamController.stream;

  Future<void> connect() async {
    try {
      await _client.connect();
      _subscribeToTopic();
    } catch (e) {
      print('Exception: $e');
      _client.disconnect();
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

  void _subscribeToTopic() {
    _client.subscribe(topic, MqttQos.atLeastOnce);
    _client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage recMess =
      c[0].payload as MqttPublishMessage;
      final String message =
      MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      print('Received message: $message');
      _messageStreamController.add(message); // Add the message to the stream
    });
  }

  void _onConnected() {
    print('Connected to MQTT Broker');
  }

  void _onDisconnected() {
    print('Disconnected from MQTT Broker');
  }
}