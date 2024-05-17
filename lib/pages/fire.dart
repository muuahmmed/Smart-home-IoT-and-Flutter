import 'package:flutter/material.dart';
import 'package:iot/pages/Bazzar.dart';
import 'package:iot/pages/subscriber.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../util/app_colors.dart';
import 'fire_values.dart';

class Fire extends StatefulWidget {
  const Fire({super.key});

  @override
  State<Fire> createState() => _FireState();
}

class _FireState extends State<Fire> {
  late MQTTManager mqttManager;
  String message = 'Waiting for message...';
  late String FireVal="26";

  @override
  void initState() {
    super.initState();
    mqttManager = MQTTManager(
      server: '192.168.137.1', // Replace with your broker IP
      topic: 'home/Fire',
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
                    child:const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
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
                            FireVal=snapshot.data!;
                            return CircularPercentIndicator(

                              radius: 110,
                              lineWidth: 20,
                              percent: 0.72,
                              progressColor: textColor,
                              center: Text(
                                FireVal,
                                style:const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 40),
                              ),
                            );

                          }
                          else {
                            return const Text(
                              'Waiting for message...',
                              style: TextStyle(fontSize: 20,color: Colors.grey),
                            );
                          }
                        },

                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Center(
                        child: Text(
                          "Fire",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white,fontSize: 25),
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
                      FireValues(
                        fireValue: double.parse(FireVal),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget generalServices({

    required String title,
    bool isActive = false,
  }) {
    return GestureDetector(
      onTap: (){
        if (title == "General"){
        }
        else {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Bazzar()));
        }
      },


      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
        decoration: BoxDecoration(
            color: isActive ? primary : Colors.transparent,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: primary)),
        child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: isActive ? Colors.black : Colors.grey),
        ),
      ),
    );
  }
}