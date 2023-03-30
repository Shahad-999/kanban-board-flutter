
import 'package:kanban_board_flutter/service_locator.dart';

import '../kanban_board_repository.dart';

class EditBoardUseCase{

  final KanbanRepository repository;
  EditBoardUseCase() : repository = getIt.get();

  Future<int> editBoardTitle(int boardId,String title){
    return repository.updateBoardTitle(boardId, title);
  }
  Future<int> editBoardDescription(int boardId,String description){
    return repository.updateBoardDescription(boardId, description);
  }

  Future deleteBoard(int boardId){
    return repository.deleteBoard(boardId);
  }

  Future changeFavoriteState(bool isFavorite,int boardId){
    return repository.favoriteBoard(boardId, isFavorite);
  }
}