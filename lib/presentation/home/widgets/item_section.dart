import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board_flutter/view_models/home_cubits/item/favorite_board_cubit.dart';

import '../../../view_models/home_cubits/board/board_cubit.dart';
import '../../../widgets/section_header.dart';

class FavoriteBoardsSection extends StatelessWidget {
  const FavoriteBoardsSection({Key? key}) : super(key: key);

  void _navToTaskDetails(int taskId) {
    //TODO nav to TaskDetails
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
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        color: CupertinoColors.destructiveRed,
                        height: 50,
                        width: 100,
                        child: Center(child: Text(state.boards[index].title))),
                  );
                }),
          )
        ]);
      } else {
        return Container();
      }
    });
  }
}
