import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board_flutter/presentation/board_details/widgets/board_details_body.dart';
import 'package:kanban_board_flutter/presentation/board_details/widgets/create_list_modal_bottom_sheet.dart';
import 'package:kanban_board_flutter/utils/common_function.dart';
import 'package:kanban_board_flutter/view_models/board_details_cubit/lists_of_board_cubit.dart';

import '../../routing/routes.dart';
import '../../view_models/board_details_cubit/board_details_cubit.dart';
import '../../widgets/floating_action_buttons.dart';
import '../../widgets/navigation_app_bar.dart';

class BoardDetailsScreen extends StatelessWidget {
  BoardDetailsScreen({Key? key, required this.boardId}) : super(key: key);

  final String boardId;

  final ListsOfBoardCubit _listsOfBoardCubit = ListsOfBoardCubit();

  void _navToEditBoard(BuildContext context) {
    pushPage(context, AppRouter.editBoardParam(boardId));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BoardDetailsCubit>(
            create: (BuildContext context) =>
                BoardDetailsCubit()..getBoard(int.parse(boardId))),
        BlocProvider<ListsOfBoardCubit>(
            create: (BuildContext context) =>
                _listsOfBoardCubit..getLists(int.parse(boardId))),
        // BlocProvider<CreateItemCubit>(create: (BuildContext context) =>  CreateItemCubit()),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: NavigationAppBar(
          actions: [
            favoriteAction(context),
            infoAction(context, () {
              _navToEditBoard(context);
            })
          ],
        ),
        body: BoardDetailsBody(),
        backgroundColor: Theme.of(context).colorScheme.background,
        floatingActionButton: AppFloatingActionButton(
          onPressed: () {
            onClickAddList(context);
          },
        ),
      ),
    );
  }

  void onClickAddList(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return BlocProvider.value(
            value: _listsOfBoardCubit,
            child: CreateListModalBottomSheet(boardId: int.parse(boardId)),
          );
        },
        elevation: 16,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24))),
        backgroundColor: Theme.of(context).colorScheme.background,
        isDismissible: true);
  }

  Widget favoriteAction(BuildContext context) {
    return BlocBuilder<BoardDetailsCubit, BoardDetailsState>(
      builder: (context, state) {
        return IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: context.read<BoardDetailsCubit>().onClickIsFavorite,
            icon: Icon(
              Icons.favorite,
              color: state is BoardDetailsSuccessfully
                  ? state.isFavorite
                      ? Colors.red
                      : Theme.of(context).colorScheme.onBackground
                  : Theme.of(context).colorScheme.onBackground,
            ));
      },
    );
  }

  Widget infoAction(BuildContext context, VoidCallback onPressedInfo) {
    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: onPressedInfo,
      icon: Icon(
        Icons.info_outline,
        color: Theme.of(context).colorScheme.onBackground,
      ),
    );
  }
}
