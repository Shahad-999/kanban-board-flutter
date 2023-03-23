
import 'package:kanban_board_flutter/domain/models/item_model.dart';
import 'package:kanban_board_flutter/service_locator.dart';

import '../kanban_board_repository.dart';

class ActiveItemsUseCase{

  final KanbanRepository repository;
  ActiveItemsUseCase() : repository = getIt.get();

  Stream<List<ItemModel>> getActiveItems(int limit){
    return repository.getAllActiveItem().take(limit);
  }

  Stream<List<ItemModel>> getAllActiveItems(){
    return repository.getAllActiveItem();
  }

}