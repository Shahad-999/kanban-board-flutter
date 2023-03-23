import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:size_config/size_config.dart';

import '../../../view_models/create_item_bottom_sheet_cubit/create_item_cubit.dart';
import 'create_item_modal_bottom_sheet.dart';

class ListHeader extends StatelessWidget {
  const ListHeader(
      {Key? key,
      required this.title,
      required this.listId})
      : super(key: key);

  final String title;
  final int listId;

  void onClickAddItem(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return BlocProvider.value(
            value: CreateItemCubit(),
            child: CreateItemModalBottomSheet(listId: listId),
          );
        },
        elevation: 16,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24))),
        backgroundColor: Theme.of(context).colorScheme.background,
        isDismissible: false);
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
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
                  onPressed: () {
                          onClickAddItem(context);
                        }
                     ,
                  icon: const Icon(Icons.add ))
            ],
          ),
        ),
    );
  }
}
