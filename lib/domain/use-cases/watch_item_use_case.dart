
import 'package:kanban_board_flutter/service_locator.dart';

import '../kanban_board_repository.dart';

class WatchItemsUseCase{

  final KanbanRepository repository;
  WatchItemsUseCase() : repository = getIt.get();

  Future watchItem(int itemId){
    return repository.watchItem(itemId);
  }

}