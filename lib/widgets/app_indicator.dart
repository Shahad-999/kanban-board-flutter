import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class AppIndicators extends StatelessWidget {
  const AppIndicators( {Key? key,required this.dotsCount, required this.currentPosition}) : super(key: key);
  final int dotsCount;
  final double currentPosition;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: dotsCount,
      position: currentPosition,
      decorator: DotsDecorator(
        color: Theme.of(context).colorScheme.primary.withAlpha(40),
        activeColor: Theme.of(context).colorScheme.primary,
        size:  const Size.square(24),
        activeSize: const Size.square(24)

      ),
    );
  }
}
