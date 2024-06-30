import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: SquareCustomPainter());
  }
}

class SquareCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final center = Offset(size.width / 2, size.height / 2);

    canvas.drawRect(
        Rect.fromCenter(
            center: center,
            width: size.shortestSide * 0.8,
            height: size.shortestSide * 0.8),
        paint);
  }

  bool shouldRepaint(covariant SquareCustomPainter oldDelegate) {
    return false;
  }
}
