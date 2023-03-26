

import '../../entities/board_entity.dart';

abstract class BoardDao{

  Stream<List<BoardEntity>> getAllBoard();
  Future<int> addBoard(BoardEntity board);
  Future deleteBoard(int boardId);
  Stream<BoardEntity> getBoard(int boardId);
  Future clearAllBoard();

  Future<int> favoriteBoard(int boardId,bool isFavorite);

  Future<int> updateBoardTitle(int boardId,String title);
  Future<int> updateBoardDescription(int boardId,String description);
}