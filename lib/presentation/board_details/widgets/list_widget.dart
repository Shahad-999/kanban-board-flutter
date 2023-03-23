import 'package:boardview/board_item.dart';
import 'package:boardview/board_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board_flutter/presentation/board_details/widgets/task_item.dart';
import 'package:kanban_board_flutter/view_models/board_details_cubit/lists_of_board_cubit.dart';
import 'list_header.dart';

Widget buildListWidget(BuildContext context,ListUi list){
  List<BoardItem> items = [];
  for (int i = 0; i < list.items.length; i++) {
    items.insert(i, buildTaskItem(context,list.items[i]) as BoardItem);
  }
  return BoardList(
    onDropList: context.read<ListsOfBoardCubit>().reorderLists,
    backgroundColor: Colors.transparent,
    items: items,
    header: [Expanded(
      child: ListHeader(
        title: list.title,
        listId: list.id,
      ),
    )],
  );
}
