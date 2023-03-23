import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:size_config/size_config.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: 200.h,
              width: 230.h,
              child: SvgPicture.asset(
                  'assets/svg/empty.svg',
                  semanticsLabel: 'No Boards'
              )
          ),
          SizedBox(height: 32.h),
          Text(
            'No Boards Yet',
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 24.sp,
                color: Theme.of(context).colorScheme.onSurface),
          )
        ],
      ),
    );
  }
}
