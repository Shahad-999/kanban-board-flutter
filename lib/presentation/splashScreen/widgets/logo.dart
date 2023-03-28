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
    var controller1 = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
    var controller2 = AnimationController(duration: const Duration(milliseconds: 1500), vsync: this);

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
    Timer(const Duration(milliseconds: 500),(){
      controller1.forward();
    });
    Timer(const Duration(milliseconds: 1500),(){
      controller2.forward();
    });

  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LogoP(_progress1,_progress2),
      child: const SizedBox(
        height: 178,
        width: 183,
      ),
    );
  }
}

class LogoP extends CustomPainter{
  double progress1;
  double progress2;
  late  Paint _paint;
  LogoP(
      this.progress1,
      this.progress2
      ){
     _paint = Paint()
      ..color = const Color(0xFF0075EB)
      ..strokeWidth = 26
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var endX = 15 + (progress1 * (67 - 15));
    var endY = 97 + (progress1 * (148 - 97));
    canvas.drawLine(const Offset(15, 97), Offset(endX, endY), _paint);

    if(progress1 ==1){
      var endX = 67 + (progress2 * (167 - 67));
      var endY = 148 + (progress2 * (48 - 148));
      canvas.drawLine(const Offset(67, 148), Offset(endX, endY), _paint);
    }

  }

  @override
  bool shouldRepaint(covariant LogoP oldDelegate) {
    return oldDelegate.progress1 != progress1 ||oldDelegate.progress2 != progress2 ;
  }

}
