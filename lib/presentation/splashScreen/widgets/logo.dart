import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Logo extends StatefulWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> with TickerProviderStateMixin {
  double _progress1 = 0.0;
  double _progress2 = 0.0;
  late Animation<double> animation1;
  late Animation<double> animation2;

  @override
  void initState() {
    super.initState();
    var controller1 = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    var controller2 = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);

    animation1 = Tween(begin: 0.0, end: 1.0).animate(controller1)
      ..addListener(() {
        setState(() {
          _progress1 = animation1.value;
        });
      });

    animation2 = Tween(begin: 0.0, end: 1.0).animate(controller2)
      ..addListener(() {
        setState(() {
          _progress2 = animation2.value;
        });
      });

    // controller1.forward();
    Timer(const Duration(milliseconds: 500), () {
      controller1.forward();
    });
    Timer(const Duration(milliseconds: 1500), () {
      controller2.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LogoP(_progress1, _progress2),
      child: const SizedBox(
        height: 178,
        width: 183,
      ),
    );
  }
}

class LogoP extends CustomPainter {
  double progress1;
  double progress2;
  late Paint _paint;

  LogoP(this.progress1, this.progress2) {
    _paint = Paint()
      ..color = const Color(0xFF024E9A)
      ..strokeWidth = 36
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    const double startX1 = 5;
    const double startY1 = 91;
    const double startX2 = 72;
    const double startY2 = 157;
    var endX = startX1 + (progress1 * (startX2 - startX1));
    var endY = startY1 + (progress1 * (startY2 - startY1));
    canvas.drawLine(const Offset(startX1, startY1), Offset(endX, endY), _paint);

    if (progress1 == 1) {
      _paint.color = const Color(0xFF0075EB);
      var endX = startX2 + (progress2 * (183 - startX2));
      var endY = startY2 + (progress2 * (47 - startY2));
      canvas.drawLine(const Offset(startX2, startY2), Offset(endX, endY), _paint);
    }
  }

  @override
  bool shouldRepaint(covariant LogoP oldDelegate) {
    return oldDelegate.progress1 != progress1 ||
        oldDelegate.progress2 != progress2;
  }
}
