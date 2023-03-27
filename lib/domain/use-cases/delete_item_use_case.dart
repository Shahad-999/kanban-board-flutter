
import 'package:kanban_board_flutter/service_locator.dart';

import '../kanban_board_repository.dart';

class DeleteItemsUseCase{

  final KanbanRepository repository;
  DeleteItemsUseCase() : repository = getIt.get();

  Future deleteItem(int itemId){
    return repository.deleteItem(itemId);
  }

}