import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kanban_board_flutter/view_models/board_details_cubit/board_details_cubit.dart';
import 'package:size_config/size_config.dart';

import '../../../routing/routes.dart';
import '../../create_board/widgets/input_view.dart';
import 'edit_text_field.dart';

class EditBoardBody extends StatelessWidget {
   const EditBoardBody({Key? key}) : super(key: key);

   _updateTitle(BuildContext context,String title){
     if(title.isNotEmpty){
       context.read<BoardDetailsCubit>().updateTitle(title);
     }
   }
   _updateDescription(BuildContext context ,String description){
     if(description.isNotEmpty){
       context.read<BoardDetailsCubit>().updateDescription(description);
     }
   }
   _updateItemAtList(String text,int index){
     print('text $text index $index');
   }

   _deleteBoard(BuildContext context){
     //TODO SHOW DIALOG
     context.read<BoardDetailsCubit>().deleteBoard();
   }

   //TODO LATER NEED REFACTOR
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BoardDetailsCubit, BoardDetailsState>(
      listener: (context ,state){
        if(state is BoardDeletedState) {
          GoRouter.of(context).go(AppRouter.homeRoute);
        }
      },
  builder: (context, state) {
    if(state is BoardDetailsSuccessfully ) {
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
              textEditingController: TextEditingController(text: state.title),
              onChange: (c){_updateTitle(context,c);},
            ),
        ),
        InputView(
            inputTitle: "Description",
            maxLength: 200,
            maxLines: 6,
            textField: EditTextField(
              maxLength: 200,
              maxLine: 6,
              textEditingController: TextEditingController(text: state.description),
              onChange: (v) {
                _updateDescription(context,v);
              },
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
              _deleteBoard(context);
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
    } else {
      return Container();
    }
  },
);
  }
}
