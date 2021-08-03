import 'package:ambition/shared/components/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CircularBackgroundPainter extends CustomPainter {
  final Paint mainPaint = Paint();
  final Paint middlePaint = Paint();
  final Paint lowerPaint;
  double high_dec = 0;
  double with_dec = 0;

  CircularBackgroundPainter(double high) : lowerPaint = new Paint() {
    high_dec = high;

    lowerPaint.color = new Color(Const.colorAdidasLogoLightest);
    lowerPaint.isAntiAlias = true;
    lowerPaint.style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    canvas.save();

    //canvas.translate(radius, radius);

    drawBellAndLeg(radius, canvas, size);

    canvas.restore();
  }

  void drawBellAndLeg(radius, canvas, Size size) {
    Path middlePath = new Path();
    middlePath.addRect(Rect.fromLTRB(-55, 0, size.width, high_dec / 4));
    middlePath.addArc(
        Rect.fromLTRB(-55, 0, size.width + 500, high_dec / 1), 0.1, 30);

    Path lowerPath = new Path();
    //path1.lineTo(size.width, 0);
    //path1.lineTo(size.width, size.height / 3);
    //path1.addOval(Rect.fromLTRB(-150, 100, size.width + 50, size.height / 2));
    lowerPath.addRect(Rect.fromLTRB(0, 0, size.width, high_dec / 5));
    lowerPath.addArc(
        Rect.fromLTRB(-90, 0, size.width + 350, high_dec / 1.15), 0.1, 30);

    //path1.quadraticBezierTo(0, size.height / 3, size.width, size.height /

    Rect outerRect = Offset.zero & const Size(300.0, 600.0);
    // In your paint method
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          Color.fromRGBO(133, 88, 58, 1),
          Color.fromRGBO(0, 220, 255, 1),
        ],
      ).createShader(outerRect);

    final paint2 = Paint()
      ..shader = LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          Color.fromRGBO(133, 88, 58, 35),
          Color.fromRGBO(0, 220, 255, 35),
        ],
      ).createShader(outerRect);

    canvas.drawPath(middlePath, paint2);

    canvas.drawPath(lowerPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
