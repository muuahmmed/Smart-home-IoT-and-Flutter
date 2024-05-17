import 'package:flutter/material.dart';

class FireValues extends StatefulWidget {
  double fireValue=20;

  FireValues({super.key,
    required this.fireValue,
  });

  @override
  State<FireValues> createState() => _FireValuesState();
}

class _FireValuesState extends State<FireValues> {

  double minHeatValue = 0;
  double maxHeatValue = 40;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      shadowColor: Colors.black12,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: Colors.grey[900],
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Heating",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Slider(
              value: widget.fireValue,
              onChanged: (newHeat) {
                setState(() {
                  widget.fireValue = newHeat; // Update the widget.fireValue value
                });
              },
              min: minHeatValue,
              max: maxHeatValue,

              divisions: ((maxHeatValue - minHeatValue) / 2).round(),
              label: widget.fireValue.round().toString(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Low",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:   widget.fireValue<=26 ? Colors.white : Colors.black54,
                    ),
                  ),
                  Text(
                    "Mid",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: widget.fireValue >= 30 ? Colors.white : Colors.black54,


                    ),
                  ),
                  Text(
                    "High",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: widget.fireValue >= 34  ? Colors.white : Colors.black54,
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
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[900],
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
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
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Low",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: fan < 27 ? Colors.white : Colors.black54,
                    ),
                  ),
                  Text(
                    "Mid",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: fan >=30  ? Colors.white : Colors.black54,
                    ),
                  ),
                  Text(
                    "High",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: fan >= 40 ? Colors.white : Colors.black54,
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
