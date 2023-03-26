import 'package:drift/drift.dart';
import 'package:kanban_board_flutter/data/local/database.dart';
import 'package:kanban_board_flutter/data/local/entities/list_entity.dart';

import '../../../../service_locator.dart';
import '../base/list_dao.dart';

class ListDriftImp extends ListDao {
  final MyDatabase database;

  ListDriftImp()
      : database = getIt.get(),
        super();

  @override
  Future<int> addList(ListEntity list) async {
    return await database.into(database.lists).insert(list);
  }

  @override
  Future deleteList(int listId) async {
    return await (database.delete(database.lists)
          ..where((tbl) => tbl.id.equals(listId)))
        .go();
  }

  @override
  Stream<List<ListEntity>> getAllList(int boardId) {
    final query = ((database.select(database.lists)
        .join([
      leftOuterJoin(database.items,
          database.items.listId.equalsExp(database.lists.id)),
    ]))
      ..where(database.lists.boardId.equals(boardId)))
      ..orderBy([OrderingTerm(expression: database.lists.order)]);

    final stream = query.watch();

    return stream.asyncMap<List<ListEntity>>((result) async {
      final rows = result.toList();
      final listMap = <int, ListEntity>{};

      for (final row in rows) {
        final list = row.readTable(database.lists);
        final item = row.readTableOrNull(database.items);

        final items = listMap.putIfAbsent(list.id, () => list);

        if (item != null) {
          items.items = List.from(items.items)..add(item);
        }
      }

      final lists = listMap.values.toList()
        ..sort((a, b) => a.order.compareTo(b.order));

      return lists;
    });
  }

  @override
  Future<int> updateList(int listId, int order) {
    return (database.update(database.lists)
      ..where((tbl) => tbl.id.equals(listId)))
        .write(ListsCompanion(
        order: Value(order)
    ));
  }

  @override
  Future<int> updateListTitle(int listId, String title) {
    return (database.update(database.lists)
      ..where((tbl) => tbl.id.equals(listId)))
        .write(ListsCompanion(
        title: Value(title)
    ));
  }
}
