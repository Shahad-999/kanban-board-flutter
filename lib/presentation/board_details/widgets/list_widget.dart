import 'package:flutter/material.dart';
import 'package:kanban_board_flutter/view_models/board_details_cubit/lists_of_board_cubit.dart';
import 'package:size_config/size_config.dart';
import 'items.dart';
import 'list_header.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({Key? key, required this.list}) : super(key: key);
  final ListUi list;

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  bool showItems = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Column(
        children: [
          ListHeader(
            title: widget.list.title,
            listId: widget.list.id,
            showItems: showItems,
            onClickShow: onClickShow,
          ),
          if (showItems && widget.list.items.isNotEmpty)
            Items(items: widget.list.items),
        ],
      ),
    );
  }

  void onClickShow() {
    setState(() {
      showItems = !showItems;
    });
  }
}
