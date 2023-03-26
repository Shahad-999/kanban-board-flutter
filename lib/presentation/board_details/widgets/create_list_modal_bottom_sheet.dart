import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board_flutter/view_models/board_details_cubit/lists_of_board_cubit.dart';
import 'package:size_config/size_config.dart';

import '../../../widgets/app_buttons.dart';
import '../../../widgets/text_field.dart';

class CreateListModalBottomSheet extends StatefulWidget {
  const CreateListModalBottomSheet({Key? key, required this.boardId})
      : super(key: key);
  final int boardId;

  @override
  State<CreateListModalBottomSheet> createState() =>
      _CreateListModalBottomSheetState();
}

class _CreateListModalBottomSheetState
    extends State<CreateListModalBottomSheet> {
  final TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 8.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Create new list',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 20.sp, fontWeight: FontWeight.w500)),
                ),
                SizedBox(height: 16.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Title',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 12.sp, fontWeight: FontWeight.w400)),
                ),
                SizedBox(height: 4.h),
                GeneralTextField(
                  maxLength: 200,
                  maxLine: 1,
                  textController: _titleController,
                ),
                SizedBox(height: 32.h),
                Padding(
                  padding: EdgeInsets.only(
                      left: (MediaQuery.of(context).size.width / 2).w,
                      right: 16.w),
                  child: AppButton(
                    onTap: _onClickCreateList,
                    textButton: 'CREATE',
                    isEnable: true,
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ));
  }

  _onClickCreateList() {
    BlocProvider.of<ListsOfBoardCubit>(context)
        .createList(widget.boardId, _titleController.text);
    Navigator.pop(context);
  }
}
