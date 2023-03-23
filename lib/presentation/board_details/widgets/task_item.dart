import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

import '../../../view_models/board_details_cubit/lists_of_board_cubit.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({Key? key, required this.item}) : super(key: key);

  final  ItemUi item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 4.h),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.secondary),
        padding: EdgeInsets.all(4.h),
        child: Padding(
          padding:
          EdgeInsets.only(left: 8.w, right: 8.w, top: 4.h, bottom: 4.h),
          child: Row(
            children: [
              Text(item.title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 13.sp, fontWeight: FontWeight.w500)),
              SizedBox(
                width: 8.w,
              ),
              Visibility(
                visible: item.isImportant,
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
