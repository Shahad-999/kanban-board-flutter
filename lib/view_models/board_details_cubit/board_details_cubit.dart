import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board_flutter/domain/use-cases/edit_board_use_case.dart';

import '../../domain/use-cases/board_details_use_case.dart';
import '../../service_locator.dart';

part 'board_details_state.dart';

class BoardDetailsCubit extends Cubit<BoardDetailsState> {
  late final BoardDetailsUseCase boardDetailsUseCase;
  late final EditBoardUseCase _editBoardUseCase;

  BoardDetailsCubit()
      : boardDetailsUseCase = getIt.get(),
        _editBoardUseCase = getIt.get(),
        super(BoardDetailsInitial());

  void getBoard(int boardId)  {
    boardDetailsUseCase.getBoard(boardId)?.listen((boardDetails) {
      if(boardDetails !=null && !isClosed){
         emit(BoardDetailsSuccessfully(boardId, boardDetails.title, boardDetails.description, boardDetails.isFavorite));
      }
    });
  }

  void onClickIsFavorite() {
    if (state is BoardDetailsSuccessfully) {
      var details = state as BoardDetailsSuccessfully;
      _editBoardUseCase.changeFavoriteState(!details.isFavorite, details.boardId);
    }
  }

  void updateTitle(String title)async{
    if (state is BoardDetailsSuccessfully && (state as BoardDetailsSuccessfully).title != title) {
      var details = state as BoardDetailsSuccessfully;
      await _editBoardUseCase.editBoardTitle(details.boardId, title);
    }
  }
  void updateDescription(String description)async{
    if (state is BoardDetailsSuccessfully) {
      var id = (state as BoardDetailsSuccessfully).boardId;
      await _editBoardUseCase.editBoardDescription(id, description);
    }
  }

  void deleteBoard() async {
    if (state is BoardDetailsSuccessfully) {
      var id = (state as BoardDetailsSuccessfully).boardId;
      await _editBoardUseCase.deleteBoard(id);
      emit(BoardDeletedState());
    }
  }
}
