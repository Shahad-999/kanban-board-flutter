import 'package:drift/drift.dart';
import 'package:kanban_board_flutter/data/local/database.dart';
import 'package:kanban_board_flutter/service_locator.dart';

import '../../entities/board_entity.dart';
import '../base/board_dao.dart';

class BoardDrfitImp extends BoardDao {
  final MyDatabase database;

  BoardDrfitImp()
      : database = getIt.get(),
        super();

  @override
  Future<int> addBoard(BoardEntity board) async {
    return await database.into(database.boards).insert(board);
  }

  @override
  Future clearAllBoard() async {
    return await (database.delete(database.boards)).go();
  }

  @override
  Future deleteBoard(int boardId) async {
    return await (database.delete(database.boards)
          ..where((tbl) => tbl.id.equals(boardId)))
        .go();
  }

  @override
  Future<int> favoriteBoard(int boardId, bool isFavorite) {
    return (database.update(database.boards)
          ..where((tbl) => tbl.id.equals(boardId)))
        .write(BoardsCompanion(isFavorite: Value(isFavorite)));
  }

  @override
  Stream<List<BoardEntity>> getAllBoard() {
    return (database.select(database.boards,distinct: true)
        .join([
      leftOuterJoin(database.lists, database.lists.boardId.equalsExp(database.boards.id)),
      leftOuterJoin(database.items, database.items.listId.equalsExp(database.lists.id))
    ])..groupBy([database.boards.id,database.lists.id,database.items.id]))
        .watch()
        .map((rows) {
      final groupedData = <BoardEntity, Map<int,int>>{};

      for (final row in rows) {
        final boards = row.readTable(database.boards);
        final lists = row.readTableOrNull(database.lists);
        final items = row.readTableOrNull(database.items);

        final board = groupedData.putIfAbsent(boards, () => {});
        if (lists != null) {
          final list = board.putIfAbsent(lists.id,()=>0);
          if(items != null ) {
              board.update(lists.id, (value) => list + 1 );
          }
        }
      }
      return groupedData.entries.map((e){
        return e.key.copyWith(list: e.value.entries.map((e) => e.value).toList());
      }).toList();
    });

  }


  Future<List<int>> getAllList(int boardId) async {
    return await (database.select(database.lists)
          ..where((tbl) => tbl.boardId.equals(1))
    )
        .map((p0) {
          print(p0);
          return p0.id;
        })
        .get();
  }

  Future<List<int?>> getNumberOfItemsInList(List<int> listIds) async {
    final f = database.items.id.count(filter: database.items.listId.isIn(listIds));
    return await (database.selectOnly(database.items)..addColumns([f])..groupBy([database.items.listId])).map((p0) => p0.read(f)).get();
  }

  @override
  Stream<BoardEntity?>? getBoard(int boardId)  {
    try{
      return  (database.select(database.boards)
        ..where((tbl) => tbl.id.equals(boardId)))
          .watchSingleOrNull();
    }catch(e){
      return null;
    }
  }

  @override
  Future<int> updateBoardTitle(int boardId, String title) {

    return (database.update(database.boards)
      ..where((tbl) => tbl.id.equals(boardId)))
        .write(BoardsCompanion(
        title: Value(title)
    )
    );
  }
  @override
  Future<int> updateBoardDescription(int boardId, String description) {

    return (database.update(database.boards)
      ..where((tbl) => tbl.id.equals(boardId)))
        .write(BoardsCompanion(
        description: Value(description)
    )
    );
  }

  @override
  Stream<List<BoardEntity>> getFavoriteBoard() {
    return (database.select(database.boards,distinct: true)
      ..where((tbl) => tbl.isFavorite.isValue(true)))
        .watch();
  }
}
