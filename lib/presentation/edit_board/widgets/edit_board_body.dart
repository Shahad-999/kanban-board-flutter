import 'package:flutter/cupertino.dart';
import 'package:size_config/size_config.dart';

import '../../create_board/widgets/input_view.dart';
import 'edit_text_feild.dart';

class EditBoardBody extends StatelessWidget {
   EditBoardBody({Key? key}) : super(key: key);
  final TextEditingController _titleController = TextEditingController(text: 'Learning Flutter');
  final TextEditingController _descriptionController = TextEditingController(text: 'Some Words :) ');
//TODO LATER NEED REFACTOR
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      children: [
        InputView(
            inputTitle: "Title",
            maxLength: 30,
            maxLines: 1,
            textField: EditTextField(
              maxLength: 30,
              maxLine: 1,
              textController: _titleController ,
            ),
        ),
        InputView(
            inputTitle: "Description",
            maxLength: 200,
            maxLines: 6,
            textField: EditTextField(
              maxLength: 200,
              maxLine: 6,
              textController: _descriptionController ,
            ),
        ),
        SizedBox(height: 16.h)
      ],
    );
  }
}
