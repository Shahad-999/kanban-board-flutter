
import 'package:kanban_board_flutter/service_locator.dart';

import '../kanban_board_repository.dart';

class EditListUseCase{

  final KanbanRepository repository;
  EditListUseCase() : repository = getIt.get();

  Future<int> editListTitle(int listId,String title){
    return repository.updateListTitle(listId, title);
  }

  Future deleteList(int listId){
    return repository.deleteList(listId);
  }

}