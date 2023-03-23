import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

@immutable
class SectionHeader extends StatelessWidget {
  final String title;
  Function? onClickSeeAll;
  bool isSeeAllVisible;

  dynamic defaultClick() {}

  SectionHeader({Key? key, required this.title, this.onClickSeeAll, this.isSeeAllVisible = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
          ),
          Visibility(
            visible: isSeeAllVisible,
            child: GestureDetector(
              onTap: (){onClickSeeAll!() ?? () {};},
              child: Text(
                'See All',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
