import 'package:flutter/material.dart';

import '../enums/custom_header.enum.dart';

class CustomHeader extends StatelessWidget {
  final CustomHeaderKeyEnum headerType;

  const CustomHeader({required this.headerType, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (headerType) {
      case CustomHeaderKeyEnum.normal:
        return Container(
          height: 300,
          decoration: const BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50))),
        );
      case CustomHeaderKeyEnum.curve:
        return SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: CustomPaint(painter: _HeaderPainter()),
        );
      default:
        return const Text("not found variable");
    }
  }
}

class _HeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCircle(center: const Offset(0.0, 55.0), radius: 180);

    const Gradient gradient = LinearGradient(
        colors: [Colors.cyan, Colors.blue],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter);

    final painter = Paint()..shader = gradient.createShader(rect);
    //properties
    painter.color = Colors.red;
    painter.style = PaintingStyle.fill; // should fill or just write lines
    painter.strokeWidth = 5;

    final path = Path();
    // just take like a pencil to some parth of paper
    path.moveTo(0, 0);
    // moves drawing a line from actual position to new position
    path.lineTo(0, size.height * 0.3);
    // draw a curve , the first to points are where the curve should go, ant he last is the point where it coneects
    /* path.quadraticBezierTo(
       size.width * 0.5, size.height * 0.5, size.width, size.height * 0.3);*/

    // draw wave
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.25,
        size.width * 0.5, size.height * 0.3);

    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.35, size.width, size.height * 0.3);

    path.lineTo(size.width, 0);

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // in this case is true but read documentation.
  }
}
