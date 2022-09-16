import 'package:flutter/material.dart';
import 'package:flutter_sensors/user_accelerometer_data.dart';

import 'accelerometer_data.dart';
import 'gyroscope_date.dart';

void main() {
  runApp(
    MaterialApp(
      home: const SensorWidget(),
    ),
  );
}

class SensorWidget extends StatelessWidget {
  const SensorWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          // cria um layout do tipo Wrap https://www.youtube.com/watch?v=wF7xPT9Cfkk
          spacing: 0.9,
          direction: Axis.vertical,
          children: [
            AccelerometerData(),
            UserAccelerometerData(),
            GyroscopeDate(),
          ],
        ),
      ),
    );
  }
}
