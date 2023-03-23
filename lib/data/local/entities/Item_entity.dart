import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';

import '../database.dart';
import 'board_entity.dart';
import 'list_entity.dart';

@UseRowClass(ItemEntity)
class Items extends Table with AutoIncrementingPrimaryKey {

  TextColumn get title => text().named('title')();
  TextColumn get description => text().named('description')();
  BoolColumn get isImportant => boolean().withDefault(const Constant(false)).named('isImportant')();
  IntColumn get listId => integer().references(Lists, #id)();
  DateTimeColumn get createDate => dateTime().named('createdDate')
      .check(createDate.isBiggerThan(Constant(DateTime(1950))))
      .withDefault(currentDateAndTime)();
  DateTimeColumn get lastUpdatedDate => dateTime().named('lastUpdateDate')
      .check(lastUpdatedDate.isBiggerThan(Constant(DateTime(1950))))
      .withDefault(currentDateAndTime)();

}


class ItemEntity  extends Insertable<ItemEntity>{

  final int id;
  final int listId;
  final String title;
  final String description;
  final bool isImportant;
  final DateTime createDate;
  final DateTime lastUpdatedDate;

  const ItemEntity({
    required this.id,
    required this.listId,
    required this.title,
    required this.description,
    required this.isImportant,
    required this.createDate,
    required this.lastUpdatedDate
  });

  @override
  Map<String, Expression<Object>> toColumns(bool nullToAbsent) {
    return ItemsCompanion(
      title: Value(title),
      isImportant: Value(isImportant),
      description: Value(description),
      listId: Value(listId),
      createDate: Value(createDate),
      lastUpdatedDate: Value(lastUpdatedDate),
    ).toColumns(nullToAbsent);
  }

}

class ItemWithBoards extends Equatable{
  final ItemEntity item;
  final String boardName;

  const ItemWithBoards( {required this.item,required this.boardName});

  @override
  List<Object?> get props => [boardName,item];

}