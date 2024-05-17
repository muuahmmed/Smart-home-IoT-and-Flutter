import 'package:flutter/material.dart';

class Heating extends StatefulWidget {
   double heatValue=20;

  Heating({
    required this.heatValue,
  });

  @override
  State<Heating> createState() => _HeatingState();
}

class _HeatingState extends State<Heating> {

  double minHeatValue = 0;
  double maxHeatValue = 40;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      shadowColor: Colors.black12,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[900],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Heating",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
            Slider(
              value: widget.heatValue,
              onChanged: (newHeat) {
                setState(() {
                  widget.heatValue = newHeat; // Update the widget.heatValue value
                });
              },
              min: minHeatValue,
              max: maxHeatValue,

              divisions: ((maxHeatValue - minHeatValue) / 2).round(),
              label: widget.heatValue.round().toString(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Low",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:   widget.heatValue<=26 ? Colors.white : Colors.black54,
                    ),
                  ),
                  Text(
                    "Mid",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: widget.heatValue >= 30 ? Colors.white : Colors.black54,


                    ),
                  ),
                  Text(
                    "High",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: widget.heatValue >= 34  ? Colors.white : Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FanSpeed extends StatefulWidget {
  const FanSpeed({Key? key}) : super(key: key);

  @override
  State<FanSpeed> createState() => _FanSpeedState();
}

class _FanSpeedState extends State<FanSpeed> {
  double fan = 26;
  double minFanValue = 20;
  double maxFanValue = 40;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      shadowColor: Colors.black12,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Fan Speed",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
            Slider(
              value: fan,
              onChanged: (newFan) {
                setState(() {
                  fan = newFan; // Update the fan speed value
                });
              },
              min: minFanValue,
              max: maxFanValue,
              divisions: ((maxFanValue - minFanValue) / 2).round(),
              label: fan.round().toString(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Low",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: fan < 27 ? Colors.blue : Colors.black54,
                    ),
                  ),
                  Text(
                    "Mid",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: fan >=30  ? Colors.blue : Colors.black54,
                    ),
                  ),
                  Text(
                    "High",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: fan >= 40 ? Colors.blue : Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
