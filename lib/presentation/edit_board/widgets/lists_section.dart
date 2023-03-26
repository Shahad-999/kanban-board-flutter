import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:size_config/size_config.dart';

import '../../../view_models/board_details_cubit/lists_of_board_cubit.dart';
import 'edit_text_field.dart';

class ListsSection extends StatelessWidget {
  const ListsSection({Key? key}) : super(key: key);


  _updateItemAtList(BuildContext context, String text,int index){
    context.read<ListsOfBoardCubit>().updateTitle(index, text);
  }

  _deleteList(BuildContext context, int index){
    context.read<ListsOfBoardCubit>().deleteList(index);
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListsOfBoardCubit, List<ListUi>>(
      builder: (context, lists) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lists',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: lists.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Dismissible(
                      onDismissed: (_){
                        _deleteList(context, index);
                      },
                      key: ValueKey("Test $index"),
                      child: EditTextField(maxLength: 10, maxLine: 1, onChange: (v){_updateItemAtList(context,v, index);},textEditingController: TextEditingController(text:lists[index].title),)
                  ),
                );
              }),
        ],
      ),
    );
  },
);
  }
}
