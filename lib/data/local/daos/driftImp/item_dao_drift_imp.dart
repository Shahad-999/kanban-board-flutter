
import 'package:drift/drift.dart';
import 'package:kanban_board_flutter/data/local/database.dart';

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
  Stream<List<ItemWithBoards>> getAllActiveItem() {
    return (database.select(database.items)
        .join(
        [
          innerJoin(database.lists, database.lists.id.equalsExp(database.items.listId),useColumns: false),
          leftOuterJoin(database.boards, database.boards.id.equalsExp(database.lists.boardId))
        ]
    )
        ..where(database.lists.order.isNotValue(1))
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


}