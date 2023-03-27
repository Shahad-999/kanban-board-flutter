
import 'package:kanban_board_flutter/domain/models/board_model.dart';
import 'package:kanban_board_flutter/service_locator.dart';

import '../kanban_board_repository.dart';

class FavoriteBoardsUseCase{

  final KanbanRepository repository;
  FavoriteBoardsUseCase() : repository = getIt.get();

  Stream<List<BoardModel>> getFavoriteBoards(){
    return repository.getFavoriteBoard();
  }

}