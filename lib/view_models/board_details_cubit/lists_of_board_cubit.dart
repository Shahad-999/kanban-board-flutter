
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board_flutter/domain/models/item_model.dart';
import 'package:kanban_board_flutter/domain/use-cases/create_list_use_case.dart';

import '../../domain/models/list_model.dart';
import '../../domain/use-cases/board_details_use_case.dart';
import '../../service_locator.dart';

part 'lists_of_board_state.dart';

class ListsOfBoardCubit extends Cubit<List<ListUi>> {
  late final BoardDetailsUseCase boardDetailsUseCase;
  late final CreateListUseCase createListUseCase;

  ListsOfBoardCubit()
      : boardDetailsUseCase = getIt.get(),
        createListUseCase = getIt.get(),
      super([]);

  late List<ListModel> currentList ;
  void getLists(int boardId){
    boardDetailsUseCase.getListsForBoard(boardId).listen((event) {
      currentList = event;
      emit(ListUi.fromModels(event));
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
  void reorder(int? newListIndex,int? oldListIndex){
    boardDetailsUseCase.reorderList(newListIndex, oldListIndex,currentList);
  }
}
