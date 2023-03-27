import 'dart:async';

import 'package:kanban_board_flutter/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board_flutter/view_models/home_cubits/mappers/board_ui_mapper.dart';
import '../../../../domain/use-cases/favorite_boards_use_case.dart';
import '../board/board_cubit.dart';

class FavoriteBoardsCubit extends Cubit<BoardState> {
  late final StreamSubscription _subscription;
  final FavoriteBoardsUseCase recentItemsUseCase;

  FavoriteBoardsCubit()
      : recentItemsUseCase = getIt.get(),
        super(BoardInitial()) {
    _subscribe();
  }


  _subscribe() {
    _subscription = recentItemsUseCase.getFavoriteBoards().listen(
      (boards) {
        if (boards.isEmpty) {
          emit(BoardEmpty());
        } else {
          emit(BoardLoaded(boards.toUiModel()));
        }
      },
    );
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
