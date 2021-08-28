import 'package:commerce/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;


class ArchPainter extends CustomPainter{
  var msize;
  ArchPainter(this.msize);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Constants.secondary;

    final rect = Rect.fromLTRB(-550, 200, msize.width + 3, msize.height + 400);

    final startAngle = -degreeToRadian(100);
    final sweepAngle = degreeToRadian(200);
    final useCenter = false;

    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  degreeToRadian(value){
    return value * (math.pi / 180 );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}