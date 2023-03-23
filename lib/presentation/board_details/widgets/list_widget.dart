import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board_flutter/view_models/board_details_cubit/lists_of_board_cubit.dart';
import 'package:kanban_board_flutter/view_models/create_item_bottom_sheet_cubit/create_item_cubit.dart';
import 'package:size_config/size_config.dart';
import 'create_item_modal_bottom_sheet.dart';

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
          _listHeader(context, widget.list.title),
          if (showItems && widget.list.items.isNotEmpty)
            _itemsList(context, widget.list.items),
        ],
      ),
    );
  }

  Widget _itemsList(BuildContext context, List<ItemUi> items) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _item(context, items[index]);
        });
  }

  Widget _item(BuildContext context, ItemUi item) {
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

  void onClickShow() {
    setState(() {
      showItems = !showItems;
    });
  }

  void onClickAddItem() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return BlocProvider.value(
            value: CreateItemCubit(),
            child:  CreateItemModalBottomSheet(listId: widget.list.id),
          );        },
        elevation: 16,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24))),
        backgroundColor: Theme.of(context).colorScheme.background,
        isDismissible: false);
  }

  Widget _listHeader(BuildContext context, String title) {
    return GestureDetector(
      onTap: onClickShow,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.secondary),
        child: Padding(
          padding:
              EdgeInsets.only(left: 16.w, right: 8.w, top: 2.h, bottom: 2.h),
          child: Row(
            children: [
              Expanded(
                child: Text(title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 13.sp, fontWeight: FontWeight.w500)),
              ),
              IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: showItems ? onClickAddItem : onClickShow,
                  icon: Icon(
                      showItems ? Icons.add : Icons.keyboard_arrow_up_outlined))
            ],
          ),
        ),
      ),
    );
  }
}
