
import 'package:drift/drift.dart';
import 'package:kanban_board_flutter/data/local/database.dart';
import 'package:kanban_board_flutter/data/local/entities/recent_item_entity.dart';

import '../../../../service_locator.dart';
import '../../entities/Item_entity.dart';
import '../base/item_dao.dart';

class ItemDriftImp extends ItemDao{


  final MyDatabase database;

  ItemDriftImp(): database = getIt.get(),super();

  @override
  Future<int> addItem(ItemEntity item) async {
    return await database.into(database.items)
        .insert(item);
  }

  @override
  Stream<List<ItemWithBoards>> getAllRecentItems() {
    return (database.select(database.recentItems)
        .join(
        [
          leftOuterJoin(database.items, database.items.id.equalsExp(database.recentItems.itemId)),
          innerJoin(database.lists, database.lists.id.equalsExp(database.items.listId),useColumns: false),
          leftOuterJoin(database.boards, database.boards.id.equalsExp(database.lists.boardId))
        ]
    )..orderBy([
          OrderingTerm(
        expression: database.recentItems.time,
        mode: OrderingMode.desc,
      ),
    ])
      ).map((row){
       return ItemWithBoards(
         item: row.readTable(database.items),
          boardName: row.readTable(database.boards).title,
        );
    }).watch();
  }

  @override
  Future deleteItem(int itemId) async{
    return await (database.delete(database.items)
      ..where((tbl) => tbl.id.equals(itemId)))
        .go();
  }

  @override
  Future<int> favoriteItem(int itemId, bool isImportant) {
    return ( database.update(database.items)
      ..where((tbl) => tbl.id.equals(itemId)))
        .write(ItemsCompanion(
        isImportant: Value(isImportant)
    ));
  }

  @override
  Stream<List<ItemEntity>> getAllItem(int listId) {
    return database.select(database.items).watch();
  }

  @override
  Future<int> moveItem(int itemId, int listId) {
    return ( database.update(database.items)
      ..where((tbl) => tbl.id.equals(itemId)))
        .write(ItemsCompanion(
        listId: Value(listId)
    ));
  }

  @override
  Future<int> watchItem(int itemId) async{
    final count = await database.customSelect('SELECT COUNT(*) as count FROM recent_items;')
        .getSingle();
    final rowCount = count.data['count'] as int;
    print('count  $rowCount');
    print('dao itemId $itemId');
    if (rowCount > 2) {
      await database.customUpdate(
          'DELETE FROM recent_items WHERE time = (SELECT MIN(time) FROM recent_items)');
    }

    final existingItem = await (database.select(database.recentItems)
      ..where((item) => item.itemId.equals(itemId)))
        .getSingleOrNull();

    if (existingItem != null) {
      await (database.update(database.recentItems)
        ..where((item) => item.itemId.equals(existingItem.itemId)))
          .write(RecentItemsCompanion(time: Value(DateTime.now())));
      return existingItem.itemId;
    } else {
      return database.into(database.recentItems).insert(
          RecentItemEntity(itemId: itemId, time: DateTime.now()));
    }

    // database.recentItems.deleteAll();
    // return Future(() => 0);
  }


}