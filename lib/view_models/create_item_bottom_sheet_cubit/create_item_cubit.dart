
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board_flutter/domain/models/item_model.dart';
import 'package:kanban_board_flutter/service_locator.dart';

import '../../domain/use-cases/create_item_use_case.dart';

part 'create_item_state.dart';

class CreateItemCubit extends Cubit<CreateItemState> {
  late final CreateItemUseCase createItemUseCase;

  CreateItemCubit() :
      createItemUseCase = getIt.get(),
        super(CreateItemInitial());
//Keep going
  Future createItem(
      int listId,
      String title,
      bool isImportant,
   ) async {
    final DateTime time = DateTime.now();
    final item = ItemModel(id: 0, listId: listId, title: title, description: '', isImportant: isImportant, createdDate: time, lastUpdateDate: time);
    print(item);
    await createItemUseCase.createItem(item);
    emit(CreateItemSuccessfully());
  }


}
