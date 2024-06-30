import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    this.sideLength = 80,
    this.strokeWidth = 2,
    this.gap = 30,
  });

  final double sideLength;
  final double strokeWidth;
  final double gap;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: SizedBox.expand(
        child: CustomPaint(
          painter: SquaresCustomPainter(
            sideLength: sideLength,
            strokeWidth: strokeWidth,
            gap: gap,
          ),
        ),
      ),
    );
  }
}

class SquaresCustomPainter extends CustomPainter {
  SquaresCustomPainter({
    this.sideLength = 80,
    this.strokeWidth = 2,
    this.gap = 30,
  });

  final double sideLength;
  final double strokeWidth;
  final double gap;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    // Calculate the number of squares that can fit on the horizontal axis
    final xCount = ((size.width + gap) / (sideLength + gap)).floor();

    // Calculate the number of squares that can fit on the vertical axis
    final yCount = ((size.height + gap) / (sideLength + gap)).floor();

    // Calculate the size of the grid of squares
    final contentSize = Size(
      (xCount * sideLength) + ((xCount - 1) * gap),
      (yCount * sideLength) + ((yCount - 1) * gap),
    );

    // Calculate the offset from which we should start painting
    // the grid so that it is eventually centered
    final offset = Offset(
      (size.width - contentSize.width) / 2,
      (size.height - contentSize.height) / 2,
    );

    final totalCount = xCount * yCount;

    canvas.save();
    canvas.translate(offset.dx, offset.dy);
    for (int index = 0; index < totalCount; index++) {
      int i = index ~/ yCount;
      int j = index % yCount;

      canvas.drawRect(
        Rect.fromLTWH(
          (i * (sideLength + gap)),
          (j * (sideLength + gap)),
          sideLength,
          sideLength,
        ),
        paint,
      );
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
