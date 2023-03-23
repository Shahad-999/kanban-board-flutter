import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

import '../../../view_models/home_cubits/model/board_ui.dart';





class BoardRow extends StatelessWidget {
  const BoardRow({Key? key, required this.board, required this.onTap})
      : super(key: key);

  final BoardUi board;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: GestureDetector(
        onTap: () {
          onTap(board.id);
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Padding(
            padding: EdgeInsets.only(
                top: 16.h, left: 16.w, right: 16.w, bottom: 4.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  board.title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                      ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Text(
                    board.description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                SizedBox(
                  height: 23.h,
                  child: ListView.builder(
                    itemExtent: 32.w,
                    scrollDirection: Axis.horizontal,
                    itemCount: board.listColor.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(board.listColor[index]),
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            board.numberItemInEachList[index].toString(),
                            style: TextStyle(
                                fontSize: 8.sp,
                                fontWeight: FontWeight.normal,
                                color: Theme.of(context).colorScheme.onSurface),
                          )
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
