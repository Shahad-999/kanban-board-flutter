
import 'package:kanban_board_flutter/domain/models/item_model.dart';
import 'package:kanban_board_flutter/service_locator.dart';

import '../kanban_board_repository.dart';

class RecentItemsUseCase{

  final KanbanRepository repository;
  RecentItemsUseCase() : repository = getIt.get();

  Stream<List<ItemModel>> getRecentItems(){
    return repository.getRecentItem();
  }

}