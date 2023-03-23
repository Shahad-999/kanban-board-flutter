import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:size_config/size_config.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({Key? key, required this.image, required this.title}) : super(key: key);

  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250.h,
          child: SvgPicture.asset(
              image,
              semanticsLabel: title
          )
        ),
        SizedBox(height: 32.h),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
