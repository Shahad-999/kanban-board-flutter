
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board_flutter/domain/models/item_model.dart';
import 'package:kanban_board_flutter/domain/use-cases/create_list_use_case.dart';
import 'package:kanban_board_flutter/domain/use-cases/edit_list_use_case.dart';
import 'package:kanban_board_flutter/domain/use-cases/delete_item_use_case.dart';

import '../../domain/models/list_model.dart';
import '../../domain/use-cases/board_details_use_case.dart';
import '../../service_locator.dart';

part 'lists_of_board_state.dart';

class ListsOfBoardCubit extends Cubit<List<ListUi>> {
  late final BoardDetailsUseCase boardDetailsUseCase;
  late final CreateListUseCase createListUseCase;
  late final DeleteItemsUseCase _deleteItemsUseCase;
  late final EditListUseCase _editListUseCase;

  ListsOfBoardCubit()
      : boardDetailsUseCase = getIt.get(),
        createListUseCase = getIt.get(),
        _deleteItemsUseCase = getIt.get(),
  _editListUseCase = getIt.get(),
      super([]);

  late List<ListModel> currentList ;
  void getLists(int boardId){
    boardDetailsUseCase.getListsForBoard(boardId).listen((event) {
      if(!isClosed){
        currentList = event;
        emit(ListUi.fromModels(event));
      }
    });
  }

  Future createList(int boardId, String title) async {
    await createListUseCase.createList(ListModel(
        id: 0,
        boardId: boardId,
        title: title,
        order: state.length+1,
        createdDate: DateTime.now(),
        lastUpdateDate: DateTime.now())
    );
  }
  void reorderLists(int? newListIndex,int? oldListIndex){
    boardDetailsUseCase.reorderList(newListIndex, oldListIndex,currentList);
  }
  void moveItem(int listIndex, int oldListIndex, int oldItemIndex){
      ListModel list = currentList[listIndex];
      ItemModel item = currentList[oldListIndex].items[oldItemIndex];
      boardDetailsUseCase.moveItem(item.id, list.id);
  }

  void deleteItem(int itemId){
    _deleteItemsUseCase.deleteItem(itemId);
  }

  void updateTitle(int index,String title){
    if (state[index].title != title) {
      _editListUseCase.editListTitle(state[index].id, title);
    }
  }

  void deleteList(int index)  {
    _editListUseCase.deleteList(state[index].id);
  }


}
