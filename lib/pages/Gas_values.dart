import 'package:flutter/material.dart';

class GasValues extends StatefulWidget {
   double GasValue = 10;

  GasValues({
    required this.GasValue,
  });

  @override
  State<GasValues> createState() => _GasValuesState();
}

class _GasValuesState extends State<GasValues> {
  double minHeatValue = 0;
  double maxHeatValue = 200;

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
                "Gas",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Slider(
              value:widget.GasValue,
              onChanged: (newHeat) {
                setState(() {
                 widget.GasValue = newHeat; // Update thewidget.GasValue value
                });
              },
              min: minHeatValue,
              max: maxHeatValue,

              divisions: ((maxHeatValue - minHeatValue) / 2).round(),
              label:widget.GasValue.round().toString(),
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
                      color:widget.GasValue < 100 ? Colors.white : Colors.black54,
                    ),
                  ),
                  Text(
                    "Mid",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:widget.GasValue>=130  ? Colors.white : Colors.black54,


                    ),
                  ),
                  Text(
                    "High",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:widget.GasValue > 180 ? Colors.white : Colors.black54,
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

