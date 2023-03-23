
import '../../service_locator.dart';
import '../kanban_board_repository.dart';
import '../models/board_model.dart';

class CreateBoardUseCase {

  final KanbanRepository repository;
  CreateBoardUseCase() : repository = getIt.get();


  Future<int> createBoard(BoardModel board){
    return repository.addBoard(board);
  }

}