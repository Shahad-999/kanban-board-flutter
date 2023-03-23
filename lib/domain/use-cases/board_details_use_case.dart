import 'dart:async';

import 'package:kanban_board_flutter/domain/models/board_model.dart';
import 'package:kanban_board_flutter/domain/models/list_model.dart';

import '../../service_locator.dart';
import '../kanban_board_repository.dart';

class BoardDetailsUseCase {
  final KanbanRepository repository;
  BoardDetailsUseCase() : repository = getIt.get();

  Future<BoardModel> getBoard(int boardId) async{
    return  await repository.getBoard(boardId);
  }

  Stream<List<ListModel>> getListsForBoard(int boardId) {
    return repository.getAllList(boardId);
  }

  Future reorderList(int? firstListIndex,int? secondListIndex,List<ListModel> currentList) async{
    if(firstListIndex !=null && secondListIndex !=null){
      final firstList = currentList[firstListIndex];
      final secondList = currentList[secondListIndex];
      repository.reorderList(firstList.id, secondList.order);
      repository.reorderList(secondList.id, firstList.order);
    }
  }
}