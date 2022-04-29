import 'package:flutter/material.dart';

class CardPainter extends CustomPainter {
  CardPainter(this.cardColor);
  final Color cardColor;

  @override
  void paint(Canvas canvas, Size size) {
    canvas
      ..drawColor(cardColor, BlendMode.srcOver)
      ..drawCircle(
        Offset(size.width * 0.2, size.height * 0.8),
        size.height * 0.5,
        Paint()
          ..shader = const RadialGradient(
            colors: [Color(0x00ffffff), Colors.white10],
          ).createShader(Offset.zero & size),
      )
      ..drawCircle(
        Offset(size.width * 0.2, size.height * 0.8),
        size.height * 0.25,
        Paint()
          ..shader = const RadialGradient(
            colors: [Color(0x00ffffff), Colors.white10],
          ).createShader(Offset.zero & size),
      );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
