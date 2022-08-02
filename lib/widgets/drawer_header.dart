
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';


class HomeDrawerHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CustomDrawerHeader_0(),
      child: SizedBox(height: 200)
    );
  }
}

class CustomDrawerHeader_0 extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //propiedades
    paint.color = Color(0xFF615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 0.5;

    final path = Path();

    //For paint_0
    path.moveTo(0, size.height/2.5);
    path.lineTo(size.width*0.05, size.height/3 - 0.5);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}