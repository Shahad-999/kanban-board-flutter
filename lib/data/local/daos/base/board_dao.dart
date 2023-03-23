

import '../../entities/board_entity.dart';

abstract class BoardDao{

  Stream<List<BoardEntity>> getAllBoard();
  Future<int> addBoard(BoardEntity board);
  Future deleteBoard(int boardId);
  Future<BoardEntity> getBoard(int boardId);
  Future clearAllBoard();

  Future<int> favoriteBoard(int boardId,bool isFavorite);

}