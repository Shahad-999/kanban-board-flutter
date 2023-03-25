import 'package:drift/drift.dart';
import 'package:kanban_board_flutter/data/local/database.dart';

import 'Item_entity.dart';

@UseRowClass(RecentItemEntity)
class RecentItems extends Table{
  IntColumn get itemId => integer().references(Items, #id)();
  DateTimeColumn get time => dateTime().named('time')
      .check(time.isBiggerThan(Constant(DateTime(1950))))
      .withDefault(currentDateAndTime)();


}
class RecentItemEntity extends Insertable<RecentItemEntity>{
  final int  itemId;
  final DateTime time;

  RecentItemEntity({required this.itemId,required this.time});

  @override
  Map<String, Expression<Object>> toColumns(bool nullToAbsent) {
    return RecentItemsCompanion(
      itemId: Value(itemId),
      time: Value(time)
    ).toColumns(nullToAbsent);
  }
}