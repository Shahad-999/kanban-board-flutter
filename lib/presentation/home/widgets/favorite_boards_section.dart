import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board_flutter/view_models/home_cubits/item/favorite_board_cubit.dart';

import '../../../routing/routes.dart';
import '../../../utils/common_function.dart';
import '../../../view_models/home_cubits/board/board_cubit.dart';
import '../../../widgets/section_header.dart';
import 'favorite_board_view.dart';

class FavoriteBoardsSection extends StatelessWidget {
  const FavoriteBoardsSection({Key? key}) : super(key: key);

  void _navToBoardDetails(BuildContext context,int boardId) {
    pushPage(context,AppRouter.boardDetailsParam('$boardId'));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBoardsCubit, BoardState>(builder: (context, state) {
      if (state is BoardLoaded) {
        return Column(children: [
          SectionHeader(title: 'Favorite Boards', isSeeAllVisible: false),
          SizedBox(
            height: 100,
            child: ListView.builder(
                itemCount: state.boards.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return FavoriteBoardView(board: state.boards[index], onTap: (id){_navToBoardDetails(context,id);});
                }),
          )
        ]);
      } else {
        return Container();
      }
    });
  }
}
