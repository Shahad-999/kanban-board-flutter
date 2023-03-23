import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board_flutter/domain/use-cases/boards_use_case.dart';
import 'package:kanban_board_flutter/view_models/home_cubits/mappers/board_ui_mapper.dart';
import '../../../../service_locator.dart';
import '../model/board_ui.dart';

part 'board_state.dart';

class BoardCubit extends Cubit<BoardState> {
  final BoardsUseCase _boardsUseCase;
  late final StreamSubscription _subscription;

  BoardCubit()
      : _boardsUseCase = getIt.get(),
        super(BoardInitial()) {
    _subscribe();
  }

  clearItems() {
    emit(BoardEmpty());
  }

  _subscribe() {
    _subscription = _boardsUseCase.getAllBoards().listen(
      (boards) {
        print(boards);
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
