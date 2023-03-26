import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

import '../../create_board/widgets/input_view.dart';
import 'edit_text_field.dart';

class EditBoardBody extends StatelessWidget {
   const EditBoardBody({Key? key}) : super(key: key);

   _updateTitle(String title){
     print('title $title');
   }
   _updateDescription(String description){
     print('description $description');
   }
   _updateItemAtList(String text,int index){
     print('text $text index $index');
   }

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
              textEditingController: TextEditingController(text: 'Learning Flutter'),
              onChange: _updateTitle,
            ),
        ),
        InputView(
            inputTitle: "Description",
            maxLength: 200,
            maxLines: 6,
            textField: EditTextField(
              maxLength: 200,
              maxLine: 6,
              textEditingController: TextEditingController(text: 'Some Words'),
              onChange: _updateDescription,
            ),
        ),
        SizedBox(height: 16.h),
        Text(
          'Lists',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 4,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Dismissible(
                  onDismissed: (_){
                    //TODO LATER DELETE ITEM
                  },
                    key: ValueKey("Test $index"),
                    child: EditTextField(maxLength: 10, maxLine: 1, onChange: (v){_updateItemAtList(v, index);},textEditingController: TextEditingController(text:'Test'),)
                ),
              );
            }),
        SizedBox(height: 8.h),
        Align(
          alignment: Alignment.bottomLeft,
          child: TextButton(
            onPressed: (){
              //TODO SHOW DIALOG
            },
            child: Text(
              'Delete this Board',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                color: Colors.red
              ),
            ),
          ),
        ),
      ],
    );
  }
}
