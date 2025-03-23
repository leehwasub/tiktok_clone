import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: ListWheelScrollView(
        diameterRatio: 3,
        useMagnifier: true,
        magnification: 1.5,
        offAxisFraction: -2,
        itemExtent: 200,
        children: [
          for (var x in [
            12,
            3,
            4,
            4,
            5,
            5,
            6,
            7,
            7,
          ])
            FractionallySizedBox(
              widthFactor: 1,
              child: Container(
                color: Colors.teal,
                alignment: Alignment.center,
                child: Text(
                  "Pick me",
                  style: TextStyle(color: Colors.white, fontSize: 39),
                ),
              ),
            )
        ],
      ),
    );
  }
}
