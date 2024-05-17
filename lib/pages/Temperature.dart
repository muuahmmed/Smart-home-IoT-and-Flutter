import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iot/pages/subscriber.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../util/app_colors.dart';
import 'Heating.dart';

class Temperature extends StatefulWidget {
  const Temperature({super.key});



  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  late MQTTManager mqttManager;
  String message = 'Waiting for message...';
  late String heatVal="26";
  late StreamController<String> _messageStreamController;


  @override
  void initState() {
    super.initState();
    mqttManager = MQTTManager(
      server: '192.168.137.1', // Replace with your broker IP
      topic: 'home/Temperature',
      clientIdentifier: 'Flutter',
    );
    connectToMQTT();
  }

  void connectToMQTT() async {
    mqttManager.connect();
  }

  @override
  void dispose() {
    mqttManager.disconnect();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 25, right: 25,top: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: textColor,
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  StreamBuilder<String>(
                    stream: mqttManager.messageStream,
                    builder: (context, snapshot){
                      if (snapshot.hasData) {
                        heatVal=snapshot.data!;
                        return CircularPercentIndicator(

                          radius: 110,
                          lineWidth: 20,
                          percent: 0.72,
                          backgroundColor: const Color(0xFFEAE4FF),
                          progressColor: textColor,
                          center: Text(
                            snapshot.data!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: textColor,
                                fontSize: 40),
                          ),
                        );

                    }
                      else {
                        return const Text(
                          'Waiting for message...',
                          style: TextStyle(fontSize: 20,color: Colors.white),
                        );
                      }

                    },

                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: Text(
                      "TEMPERATURE",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: textColor),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      generalServices(title: 'General',isActive: true),
                      generalServices(title: 'Services',isActive: false),

                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Heating(
                    heatValue: double.parse(heatVal),

                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const FanSpeed()
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  Container generalServices({
    required String title,
    bool isActive = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
      decoration: BoxDecoration(
          color: isActive ? Colors.grey[900] : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: primary)),
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: isActive ? Colors.white : Colors.grey),
      ),
    );
  }
}
