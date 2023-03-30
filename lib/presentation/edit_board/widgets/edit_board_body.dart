import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kanban_board_flutter/view_models/board_details_cubit/board_details_cubit.dart';
import 'package:size_config/size_config.dart';

import '../../../routing/routes.dart';
import '../../../widgets/dialog.dart';
import 'general_info_section.dart';
import 'lists_section.dart';

class EditBoardBody extends StatelessWidget {
  const EditBoardBody({Key? key}) : super(key: key);

  _deleteBoard(BuildContext context) {
    context.read<BoardDetailsCubit>().deleteBoard();
  }

  //TODO LATER NEED REFACTOR
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BoardDetailsCubit, BoardDetailsState>(
      listener: (context, state) {
        if (state is BoardDeletedState) {
          context.pushReplacement(AppRouter.homeRoute);
        }
      },
      builder: (context, state) {
        if (state is BoardDetailsSuccessfully) {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            children: [
              const GeneralInfoSection(),
              const ListsSection(),
              SizedBox(height: 8.h),
              Align(
                alignment: Alignment.bottomLeft,
                child: TextButton(
                  onPressed: () {
                    showDeleteDialog(context, () {
                      _deleteBoard(context);
                    }, 'Delete Board', 'Do you want to delete this board ? ');
                  },
                  child: Text(
                    'Delete this Board',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.red),
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
