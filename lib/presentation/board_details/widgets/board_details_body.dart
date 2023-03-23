import 'package:boardview/board_list.dart';
import 'package:boardview/boardview.dart';
import 'package:boardview/boardview_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board_flutter/view_models/board_details_cubit/lists_of_board_cubit.dart';
import 'package:size_config/size_config.dart';

import 'board_header.dart';
import 'list_widget.dart';

class BoardDetailsBody extends StatelessWidget {
  BoardDetailsBody({Key? key}) : super(key: key);
  final BoardViewController boardViewController = BoardViewController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListsOfBoardCubit, List<ListUi>>(
      builder: (context, state) {
        List<BoardList> _lists = <BoardList>[];
        for (int i = 0; i < state.length; i++) {
          _lists.add(buildListWidget(context,state[i]) as BoardList);
        }
        return ListView(
          children: [
            const BoardHeader(),
            if(state.isNotEmpty) Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SizedBox(
                height: 10000,
                child: BoardView(
                  lists: _lists,
                  boardViewController: boardViewController,
                ),
              )
            ),
            if(state.isEmpty) _noListFound()
          ],
        );
      },
    );
  }

  Widget _noListFound(){
    return const Center(
      child: Icon(Icons.hourglass_empty),
    );
  }

}
