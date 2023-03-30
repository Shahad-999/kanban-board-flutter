import 'dart:async';

import 'package:kanban_board_flutter/domain/models/board_model.dart';
import 'package:kanban_board_flutter/domain/models/list_model.dart';

import '../../service_locator.dart';
import '../kanban_board_repository.dart';

class BoardDetailsUseCase {
  final KanbanRepository repository;
  BoardDetailsUseCase() : repository = getIt.get();

  Stream<BoardModel?>? getBoard(int boardId) {
    return  repository.getBoard(boardId);
  }

  Stream<List<ListModel>> getListsForBoard(int boardId) {
    return repository.getAllList(boardId);
  }

  Future reorderList(int? firstListIndex,int? secondListIndex,List<ListModel> currentList) async{
    if(firstListIndex !=null && secondListIndex !=null){
      final firstList = currentList[firstListIndex];
      final secondList = currentList[secondListIndex];
      await repository.reorderList(firstList.id, secondList.order);
      await repository.reorderList(secondList.id, firstList.order);
    }
  }
  Future moveItem(itemId, newListId)async{
    await repository.moveItem(itemId, newListId);
  }
}