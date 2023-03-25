import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:size_config/size_config.dart';

import '../../../view_models/create_item_bottom_sheet_cubit/create_item_cubit.dart';
import '../../../widgets/app_buttons.dart';
import '../../../widgets/custom_switch.dart';
import '../../../widgets/text_field.dart';

class CreateItemModalBottomSheet extends StatefulWidget {
  const CreateItemModalBottomSheet({Key? key, required this.listId})
      : super(key: key);
  final int listId;

  @override
  State<CreateItemModalBottomSheet> createState() =>
      _CreateItemModalBottomSheetState();
}

class _CreateItemModalBottomSheetState
    extends State<CreateItemModalBottomSheet> {
  final TextEditingController _titleController = TextEditingController();

  bool isImportant = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateItemCubit, CreateItemState>(
      listener: (context, state) {
        if (state is CreateItemSuccessfully) Navigator.of(context).pop();
      },
      child: Padding(
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
                  child: Text('Create new item',
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
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Is important',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 12.sp, fontWeight: FontWeight.w400),
                      ),
                    ),
                    CustomSwitch(
                      onChange: (value) {
                        setState(() {
                          isImportant = value;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
                Padding(
                  padding: EdgeInsets.only(
                      left: (MediaQuery.of(context).size.width / 2).w,
                      right: 16.w),
                  child: AppButton(
                    onTap: _onClickCreate,
                    textButton: 'CREATE',
                    isEnable: true,
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onClickCreate() {
    BlocProvider.of<CreateItemCubit>(context)
        .createItem(widget.listId, _titleController.text, isImportant);
  }
}
