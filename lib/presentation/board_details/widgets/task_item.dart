import 'package:boardview/board_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:size_config/size_config.dart';

import '../../../view_models/board_details_cubit/lists_of_board_cubit.dart';

Future<void> _showMyDialog(BuildContext context,VoidCallback onClickDelete) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        contentPadding: const EdgeInsets.all(24),
        title:  Text(
            'Delete Task ',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children:  <Widget>[
              Text(
                  'Do you want to delete this task',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: onClickDelete,
            child: const Text('Delete',style: TextStyle(color: Colors.red),),
          ),
        ],
      );
    },
  );
}
Widget buildTaskItem(BuildContext context,ItemUi item){
  return BoardItem(
    onDropItem: (int? listIndex, int? itemIndex, int? oldListIndex, int? oldItemIndex, BoardItemState? state) {
      if(listIndex !=null && itemIndex !=null && oldItemIndex !=null && oldListIndex !=null){
          context.read<ListsOfBoardCubit>().moveItem(listIndex, oldListIndex, oldItemIndex);
      }
    } ,
    item: Padding(
      padding: EdgeInsets.only(top: 4.h),
      child: GestureDetector(
        onDoubleTap: (){
          _showMyDialog(context,(){
            context.read<ListsOfBoardCubit>().deleteItem(item.id);
            Navigator.of(context).pop();
          });
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
      ),
    ),
  );
}