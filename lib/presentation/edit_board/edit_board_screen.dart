import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board_flutter/presentation/edit_board/widgets/edit_board_body.dart';
import 'package:kanban_board_flutter/widgets/navigation_app_bar.dart';

import '../../view_models/board_details_cubit/board_details_cubit.dart';

class EditBoardScreen extends StatelessWidget {
  const EditBoardScreen({Key? key, required this.boardId}) : super(key: key);
  final String boardId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .background,
      appBar: const NavigationAppBar(),
      body: BlocProvider(
        create: (context) => BoardDetailsCubit()..getBoard(int.parse(boardId)),
        child: const EditBoardBody(),
      ),
    );
  }
}
