import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board_flutter/view_models/board_details_cubit/lists_of_board_cubit.dart';
import 'package:size_config/size_config.dart';

import 'board_header.dart';
import 'list_widget.dart';

class BoardDetailsBody extends StatelessWidget {
  const BoardDetailsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListsOfBoardCubit, List<ListUi>>(
      builder: (context, state) {
        return ListView(
          children: [
            const BoardHeader(),
            if(state.isNotEmpty) Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ListView.builder(
                  itemCount: state.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListWidget(list: state[index]);
                  }
              ),
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
