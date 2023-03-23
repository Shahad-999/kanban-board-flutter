
import 'package:kanban_board_flutter/service_locator.dart';

import '../kanban_board_repository.dart';
import '../models/board_model.dart';

class BoardsUseCase{

  final KanbanRepository repository;
  BoardsUseCase() : repository = getIt.get();


  Stream<List<BoardModel>> getAllBoards(){
    return repository.getAllBoard();
  }

}