import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class AccelerometerData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AccelerometerEvent>(
      stream: accelerometerEvents,
      builder: (context, accel) {
        final data = accel.data;
        if (data != null) {
          final x = data.x.toStringAsFixed(2);
          final y = data.y.toStringAsFixed(2);
          final z = data.z.toStringAsFixed(2);

          return ChipWithIcon(
              icon: Icon(Icons.drive_eta), text: "Accelerometer: $x, $y, $z");
        }

        return const Text("No Data to display.");
      },
    );
  }
}

class ChipWithIcon extends StatelessWidget {
  final Icon icon;
  final String text;
  const ChipWithIcon({required this.icon, required this.text});
  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: icon,
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      labelPadding: const EdgeInsets.only(left: 10),
      label: Text(text),
    );
  }
}
