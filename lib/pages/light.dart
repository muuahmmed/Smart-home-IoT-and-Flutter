import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class light extends StatelessWidget {

  final bool powerOn;

  light({
    super.key,

    required this.powerOn,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: powerOn ? Colors.grey[900] : Color.fromARGB(44, 164, 167, 189),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // icon

                  // smart device name + switch
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 22.0),
                          child: Text(
                            "Light",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: powerOn ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Transform.rotate(
                        angle: pi / 2,
                        child: CupertinoSwitch(
                          value: powerOn,
                          onChanged: (bool value) {  },

                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
