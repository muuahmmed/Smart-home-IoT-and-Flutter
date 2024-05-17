import 'package:flutter/material.dart';
import 'package:iot/pages/subscriber.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../util/app_colors.dart';
import 'Gas_values.dart';


class Gas extends StatefulWidget {


  @override
  State<Gas> createState() => _GasState();
}

class _GasState extends State<Gas> {
  late MQTTManager mqttManager;
  String message = 'Waiting for message...';
  late String GasValue = "117";
  @override
  void initState() {
    super.initState();
    mqttManager = MQTTManager(
      server: '192.168.137.1', // Replace with your broker IP
      topic: 'home/Gas',
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
                    child: const Icon(
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
                            GasValue=snapshot.data!;
                            return CircularPercentIndicator(

                              radius: 110,
                              lineWidth: 20,
                              percent: 0.72,
                              progressColor: Colors.white,
                              center: Text(
                                snapshot.data!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 40),
                              ),
                            );

                          }
                          else {
                            return const Text(
                              'Waiting for message...',
                              style: TextStyle(fontSize: 20),
                            );
                          }
                        },

                      ),
                      const SizedBox(
                        height: 25,
                      ),
                     const Center(
                        child: Text(
                          "Gas",
                          style: TextStyle(fontSize: 20,
                              fontWeight: FontWeight.bold, color: Colors.white),
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
                      GasValues(
                        GasValue: double.parse(GasValue),

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
       if(title=="General"){
        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FetchData()));

       }
       else {
        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FetchLastValue()));
       }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
        decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.transparent,
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
