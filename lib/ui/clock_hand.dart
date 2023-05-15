import 'package:flutter/material.dart';

class ClockHand extends StatelessWidget {
  const ClockHand(
      {Key? key,
      required this.handThickness,
      required this.rotationZAngle,
      required this.handLength,
      required this.color})
      : super(key: key);

  final double handThickness;
  final double rotationZAngle;
  final double handLength;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.topCenter,
      transform: Matrix4.identity()
      ..translate(-handThickness/2, 0.0,0.0)
      ..rotateZ(rotationZAngle),
      child: Container(
        height: handLength,
        width: handThickness,
        color: color,
      ),
    );
  }
}
