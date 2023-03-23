
import 'package:kanban_board_flutter/domain/models/list_model.dart';

import '../../service_locator.dart';
import '../kanban_board_repository.dart';

class CreateListUseCase {

  final KanbanRepository repository;
  CreateListUseCase() : repository = getIt.get();


  Future<int> createList(ListModel list){
    return repository.addList(list);
  }

}