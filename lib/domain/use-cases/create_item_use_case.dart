
import 'package:kanban_board_flutter/domain/models/item_model.dart';
import '../../service_locator.dart';
import '../kanban_board_repository.dart';

class CreateItemUseCase {

  final KanbanRepository repository;
  CreateItemUseCase() : repository = getIt.get();


  Future<int> createItem(ItemModel item){
    return repository.addItem(item);
  }

}