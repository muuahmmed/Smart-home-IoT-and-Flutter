import 'package:flutter/material.dart';
import 'package:iot/pages/Gas.dart';
import 'package:iot/pages/Temperature.dart';
import 'package:iot/pages/fire.dart';
import 'package:iot/pages/light.dart';
import 'components.dart';

class temp extends StatefulWidget {
  const temp({super.key});

  @override
  State<temp> createState() => _tempState();
}

class _tempState extends State<temp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 40,left: 25,right: 25),
            child: Column(
              children: [
                const Text("Welcome to your Smart Home App",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
                const SizedBox(height: 50,),
                Expanded(
                    child:ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20.0),
                        ),
                        Container(
                          height: 200,
                          width: double.infinity,
                          color: Colors.grey[900],
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MaterialButton(
                                        onPressed: () {
                                          navigateTo(context, const Fire());
                                        },
                                        child: IconButton(onPressed: (){
                                          navigateTo(context, const Fire());
                                        }, icon: const Icon(Icons.local_fire_department_outlined,size: 100,color: Colors.white,),)
                                    ),
                                    const Text('Fire', style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),)
                                  ],
                                ),
                              ),
                              Container( color:
                              Colors.black,width: 20,),
                              Expanded(child:
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MaterialButton(
                                      onPressed: () {
                                        navigateTo(context,  Gas());
                                      },
                                      child: IconButton(onPressed: (){
                                        navigateTo(context,  Gas());
                                      }, icon: const Icon(Icons.gas_meter,size: 100,color: Colors.white,),)
                                  ),
                                  const Text('Gas', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),)
                                ],
                              ),),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          height: 200,
                          width: double.infinity,
                          color: Colors.grey[900],
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MaterialButton(
                                        onPressed: () {
                                          navigateTo(context,  light(powerOn: false,));
                                        },
                                        child: IconButton(onPressed: (){
                                          navigateTo(context,  light(powerOn: false,));
                                        }, icon: const Icon(Icons.light,size: 100,color: Colors.white,),)
                                    ),
                                    const Text('Lightening', style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),)
                                  ],
                                ),),
                              Container( color: Colors.black,width: 20,),
                              Expanded(child:
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MaterialButton(
                                      onPressed: () {
                                        navigateTo(context,  const Temperature());
                                      },
                                      child: IconButton(onPressed: (){
                                        navigateTo(context,  const Temperature());
                                      }, icon: const Icon(Icons.thermostat,size: 100,color: Colors.white,),)
                                  ),
                                  const Text('Temperature', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),)
                                ],
                              ),),
                            ],
                          ),
                        ),
                      ],
                    )
                )
              ],
            ),
        ),
      ),
    );
  }
}
