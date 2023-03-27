import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

import '../../../view_models/home_cubits/model/board_ui.dart';

class FavoriteBoardView extends StatelessWidget {
  const FavoriteBoardView({Key? key,required this.board, required this.onTap}) : super(key: key);
  final BoardUi board;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(right: 8.h),
      child: GestureDetector(
        onTap: () {
          onTap(board.id);
        },
        child: Container(
          height: 90.h,
          width: 140.w,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Padding(
            padding: EdgeInsets.only(
                top: 16.h, left: 16.w, right: 16.w, bottom: 4.h),
            child: Text(
              board.title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
              ),
              maxLines: 2,
            ),
          ),
        ),
      ),
    );
  }
}
