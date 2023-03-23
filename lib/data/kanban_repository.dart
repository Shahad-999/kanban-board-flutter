import 'package:kanban_board_flutter/data/local/entities/Item_entity.dart';
import 'package:kanban_board_flutter/domain/models/board_model.dart';

import 'package:kanban_board_flutter/domain/models/item_model.dart';

import 'package:kanban_board_flutter/domain/models/list_model.dart';
import 'package:kanban_board_flutter/service_locator.dart';

import '../domain/kanban_board_repository.dart';
import 'local/daos/base/board_dao.dart';
import 'local/daos/base/item_dao.dart';
import 'local/daos/base/list_dao.dart';

class KanbanRepositoryImp extends KanbanRepository {

  final BoardDao boardDao;
  final ListDao listDao;
  final ItemDao itemDao;

  KanbanRepositoryImp()
      : boardDao = getIt.get(),
        listDao = getIt.get(),
        itemDao = getIt.get(),
        super();

  @override
  Future<int> addBoard(BoardModel board) {
    return boardDao.addBoard(board.toEntity());
  }

  @override
  Future<int> addItem(ItemModel item) {
    return itemDao.addItem(item.toEntity());
  }

  @override
  Future<int> addList(ListModel list) {
    return listDao.addList(list.toEntity());
  }

  @override
  Future clearAllBoard() {
    return boardDao.clearAllBoard();
  }

  @override
  Future deleteBoard(int boardId) {
    return boardDao.deleteBoard(boardId);
  }

  @override
  Future deleteItem(int itemId) {
    return itemDao.deleteItem(itemId);
  }

  @override
  Future deleteList(int listId) {
    return listDao.deleteList(listId);
  }

  @override
  Future<int> favoriteBoard(int boardId, bool isFavorite) {
    return boardDao.favoriteBoard(boardId, isFavorite);
  }

  @override
  Future<int> favoriteItem(int itemId, bool isImportant) {
    return itemDao.favoriteItem(itemId, isImportant);
  }

  @override
  Stream<List<BoardModel>> getAllBoard() {
    return boardDao
        .getAllBoard()
        .map((event) => BoardModel.mapFromListOfEntity(event));
  }

  @override
  Stream<List<ItemModel>> getAllItem(int listId) {
    return itemDao
        .getAllItem(listId)
        .map((event) => ItemModel.mapFromListOfEntity(event.map((e) => ItemWithBoards(item: e, boardName: 'boardName')).toList())); //TODO CHANGE IT LATER
  }

  @override
  Stream<List<ItemModel>> getAllActiveItem() {
    return itemDao.getAllActiveItem()
        .map((event) => ItemModel.mapFromListOfEntity(event));
  }

  @override
  Stream<List<ListModel>> getAllList(int boardId) {
    return listDao
        .getAllList(boardId)
        .map((event) => ListModel.mapFromListOfEntity(event));
  }

  @override
  Future<BoardModel> getBoard(int boardId) {
    return boardDao
        .getBoard(boardId)
        .then((value) => BoardModel.mapFromEntity(value));
  }

  @override
  Future<int> moveItem(int itemId, int listId) {
    return itemDao.moveItem(itemId, listId);
  }
}
