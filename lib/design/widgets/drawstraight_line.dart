import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Drawhorizontalline extends CustomPainter {
  late Size _sized;
  late Paint _paint;
  Drawhorizontalline({sized}) {
    _sized = sized;
    _paint = Paint()
      ..color = HexColor("#64F180")
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
  }
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(-90.0, 0.0), Offset(_sized.width, 0.0), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class Drawverticalline extends CustomPainter {
  late Paint _paint;
  late Size _sized;
  Drawverticalline({sized}) {
    _sized = sized;
    _paint = Paint()
      ..color = HexColor("#64F180")
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
  }
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
        Offset(0.0, _sized.height * 0.01), Offset(0.0, _sized.height * 1), _paint);
  }

// 32.0
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class Drawverticalline2 extends CustomPainter {
  late Paint _paint;
  late Size _sized;
  Drawverticalline2({sized}) {
    _sized = sized;
    _paint = Paint()
      ..color = HexColor("#64F180")
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
  }
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
        Offset(0.0, _sized.height * 0.01), Offset(0.0, _sized.height * 0.98), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
