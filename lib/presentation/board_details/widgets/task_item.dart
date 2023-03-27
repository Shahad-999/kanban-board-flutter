import 'package:boardview/board_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:size_config/size_config.dart';

import '../../../view_models/board_details_cubit/lists_of_board_cubit.dart';
import '../../../widgets/dialog.dart';

Widget buildTaskItem(BuildContext context, ItemUi item) {
  return BoardItem(
    onDropItem: (int? listIndex, int? itemIndex, int? oldListIndex,
        int? oldItemIndex, BoardItemState? state) {
      if (listIndex != null &&
          itemIndex != null &&
          oldItemIndex != null &&
          oldListIndex != null) {
        context
            .read<ListsOfBoardCubit>()
            .moveItem(listIndex, oldListIndex, oldItemIndex);
      }
    },
    item: Padding(
      padding: EdgeInsets.only(top: 4.h),
      child: GestureDetector(
        onDoubleTap: () {
          showDeleteDialog(context, () {
            context.read<ListsOfBoardCubit>().deleteItem(item.id);
            Navigator.of(context).pop();
          }, 'Delete Task', 'Do you want to delete this task ? ');
        },
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
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 13.sp, fontWeight: FontWeight.w500)),
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
      ),
    ),
  );
}
