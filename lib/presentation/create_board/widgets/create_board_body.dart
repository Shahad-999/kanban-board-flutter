import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:size_config/size_config.dart';
import '../../../view_models/create_board_cubit/create_board_cubit.dart';
import '../../../widgets/app_buttons.dart';
import '../../../widgets/custom_switch.dart';
import 'input_view.dart';
import 'list_view.dart';

class CreateBoardBody extends StatelessWidget {
  const CreateBoardBody({Key? key}) : super(key: key);

  _createBoard(BuildContext context){
    context.read<CreateBoardCubit>().createBoard();
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CreateBoardCubit(),
        child: BlocBuilder<CreateBoardCubit, BoardInfoState>(
            builder: (context, state) {
          return Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Planing For New PROJECT',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500)),
                          const Divider(thickness: 2.0),
                          InputView(
                              inputTitle: 'Title',
                              maxLength: 30,
                              maxLines: 1,
                              onChange:
                                  context.read<CreateBoardCubit>().updateTitle),
                          InputView(
                            inputTitle: 'Description',
                            maxLength: 200,
                            maxLines: 6,
                            onChange: context
                                .read<CreateBoardCubit>()
                                .updateDescription,
                          ),
                          SizedBox(height: 16.h),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Is important',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500),
                                ),
                              ),
                               CustomSwitch(
                                onChange: (isImportant){
                                  context.read<CreateBoardCubit>().updateIsImportant(isImportant);
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            'Lists',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500),
                          ),
                          ReorderableListView(
                            shrinkWrap: true,
                            onReorder: context.read<CreateBoardCubit>().reorder,
                            children: [
                              for (int i = 0; i < state.list.length; i++)
                                Dismissible(
                                  key: ValueKey("${state.list[i]}-$i"),
                                  onDismissed: (_){
                                    context
                                        .read<CreateBoardCubit>()
                                        .deleteItemFromList(i);
                                  },
                                  child: ListItem(
                                    key: ValueKey("${state.list[i]}-$i"),
                                    listTitle: state.list[i],
                                    onChange: (value) {
                                      context.read<CreateBoardCubit>().updateItemInList(i, value);
                                    },
                                  ),
                                )
                            ],
                          ),
                          Center(
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: ElevatedButton.icon(
                                  onPressed: context.read<CreateBoardCubit>().addItemToList,
                                  icon: Icon(Icons.add,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary),
                                  label: const Text('ADD'),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      textStyle: TextStyle(
                                          fontSize: 15,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary),
                                      alignment: Alignment.centerLeft,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)))),
                            ),
                          ),
                          SizedBox(height: 24.h)
                        ],
                      )),
                ),
              ),
              Positioned(
                  right: 24.w,
                  bottom: 32.h,
                  child: AppButton(
                    onTap: (){
                      _createBoard(context);
                    },
                    textButton: 'CREATE',
                    isEnable: state.isButtonEnabled,
                  ))
            ],
          );
        }));
  }
}
