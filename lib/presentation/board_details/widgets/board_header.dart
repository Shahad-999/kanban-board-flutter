import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board_flutter/view_models/board_details_cubit/board_details_cubit.dart';
import 'package:size_config/size_config.dart';

class BoardHeader extends StatelessWidget {
  const BoardHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoardDetailsCubit, BoardDetailsState>(
      builder: (context, state) {
        final String title;
        if(state is BoardDetailsSuccessfully) {
          title = (state).title;
        } else {
          title =  '';
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontSize: 20.sp, fontWeight: FontWeight.w500),
          ),
        );
      },

    );
  }
}
