import 'dart:math';

import 'package:flutter/material.dart';

class ClockSecondsTickMarker extends StatelessWidget {
  const ClockSecondsTickMarker(
      {Key? key, required this.radius, required this.seconds})
      : super(key: key);

  final double radius;
  final int seconds;

  @override
  Widget build(BuildContext context) {
    final color = seconds % 5 == 0 ? Colors.white : Colors.grey[700];
    const width = 2.0;
    const height = 12.0;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2, 0)
        ..rotateZ(2 * pi * (seconds / 60.0))
        ..translate(0.0, radius - height / 2, 0.0),
      child: Container(
        width: width,
        height: height,
        color: color,
      ),
    );
  }
}

class ClockTextMarker extends StatelessWidget {
  const ClockTextMarker(
      {Key? key,
      required this.value,
      required this.radius,
      required this.maxValue})
      : super(key: key);

  final int value;
  final double radius;
  final int maxValue;

  @override
  Widget build(BuildContext context) {
    //final color = seconds % 5 == 0 ? Colors.white : Colors.grey[700];
    const width = 40.0;
    const height = 30.0;
    return Transform(
        alignment: Alignment.topCenter,
        transform: Matrix4.identity()
          ..translate(-width / 2, -height / 2, 0.0)
          ..rotateZ(pi + 2 * pi * (value / maxValue))
          ..translate(0.0, radius - 35, 0.0)
          ..rotateZ(pi - 2 * pi * (value / maxValue)),
        child: SizedBox(
          height: height,
            width: width,
            child: Text(
              value.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white
            ),
            )));
  }
}
