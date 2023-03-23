import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board_flutter/routing/routes.dart';

import '../../../utils/common_function.dart';
import '../../../view_models/home_cubits/board/board_cubit.dart';
import '../../../widgets/section_header.dart';
import 'board_row.dart';

class BoardSection extends StatelessWidget {
  const BoardSection({Key? key}) : super(key: key);

  void _navToBoardDetails(BuildContext context,int boardId) {
    pushPage(context,AppRouter.boardDetailsParam('$boardId'));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoardCubit, BoardState>(builder: (context, state) {
      if (state is BoardLoaded) {
        return Column(children: [
          SectionHeader(title: 'Boards'),
          ListView.builder(
              itemCount: state.boards.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return BoardRow(
                    board: state.boards[index], onTap: (id){_navToBoardDetails(context,id);});
              })
        ]);
      } else {
        return Container();
      }
    });
  }
}
