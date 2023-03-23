import 'package:drift/drift.dart';
import 'package:kanban_board_flutter/data/local/entities/Item_entity.dart';

import '../database.dart';
import 'board_entity.dart';

@UseRowClass(ListEntity)
class Lists extends Table with AutoIncrementingPrimaryKey {

  TextColumn get title => text().named('title')();
  IntColumn get order => integer().named('order')();
  IntColumn get boardId => integer().references(Boards, #id)();
  DateTimeColumn get createDate => dateTime().named('createdDate')
      .check(createDate.isBiggerThan(Constant(DateTime(1950))))
      .withDefault(currentDateAndTime)();
  DateTimeColumn get lastUpdatedDate => dateTime().named('lastUpdateDate')
      .check(lastUpdatedDate.isBiggerThan(Constant(DateTime(1950))))
      .withDefault(currentDateAndTime)();

}


class ListEntity extends Insertable<ListEntity>{

  final int id;
  final int boardId;
  final String title;
  final int order;
  List<ItemEntity> items ;
  final DateTime createDate;
  final DateTime lastUpdatedDate;

   ListEntity({
    required this.id,
    required this.boardId,
    required this.title,
    this.items = const[],
    required this.order,
    required this.createDate,
    required this.lastUpdatedDate
  });

  @override
  Map<String, Expression<Object>> toColumns(bool nullToAbsent) {
    return ListsCompanion(
      title: Value(title),
      order: Value(order),
      boardId: Value(boardId),
      createDate: Value(createDate),
      lastUpdatedDate: Value(lastUpdatedDate),
    ).toColumns(nullToAbsent);
  }

}