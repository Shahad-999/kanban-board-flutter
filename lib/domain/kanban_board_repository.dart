
import 'package:kanban_board_flutter/domain/models/board_model.dart';
import 'package:kanban_board_flutter/domain/models/item_model.dart';
import 'package:kanban_board_flutter/domain/models/list_model.dart';

abstract class KanbanRepository{

  //region board
  Stream<List<BoardModel>> getAllBoard();
  Future<int> addBoard(BoardModel board);
  Future deleteBoard(int boardId);
  Future<BoardModel> getBoard(int boardId);
  Future clearAllBoard();
  Future<int> favoriteBoard(int boardId,bool isFavorite);
  //endregion board

  //region list
  Stream<List<ListModel>> getAllList(int boardId);
  Future<int>  addList(ListModel list);
  Future deleteList(int listId);
  Future<int> reorderList(int listId, int newOrder);
  //endregion list

  //region item
  Stream<List<ItemModel>> getAllItem(int listId);
  Stream<List<ItemModel>> getAllActiveItem();
  Future<int>  addItem(ItemModel item);
  Future deleteItem(int itemId);

  Future<int> moveItem(int itemId,int listId);
  Future<int> favoriteItem(int itemId,bool isImportant);
  //endregion item

}