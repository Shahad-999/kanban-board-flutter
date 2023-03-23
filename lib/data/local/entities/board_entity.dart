import 'package:drift/drift.dart';

import '../database.dart';

@UseRowClass(BoardEntity)
class Boards extends Table with AutoIncrementingPrimaryKey {
  TextColumn get title => text().named('title')();
  TextColumn get description => text().named('description')();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false)).named('isFavorite')();
  DateTimeColumn get createDate => dateTime().named('createdDate')
      .check(createDate.isBiggerThan(Constant(DateTime(1950))))
      .withDefault(currentDateAndTime)();
  DateTimeColumn get lastUpdatedDate => dateTime().named('lastUpdateDate')
      .check(lastUpdatedDate.isBiggerThan(Constant(DateTime(1950))))
      .withDefault(currentDateAndTime)();

}

mixin AutoIncrementingPrimaryKey on Table {
  IntColumn get id => integer().autoIncrement()();
}


class BoardEntity  extends Insertable<BoardEntity>{

  final int id;
  final String title;
  final String description;
  final List<int> list;
  final bool isFavorite;
  final DateTime createDate;
  final DateTime lastUpdatedDate;

  BoardEntity({required this.id,
    required this.title,
    this.list = const [],
    required this.description,
    required this.isFavorite,
    required this.createDate,
    required this.lastUpdatedDate});

  @override
  Map<String, Expression<Object>> toColumns(bool nullToAbsent) {
    return BoardsCompanion(
      title: Value(title),
      description: Value(description),
      isFavorite: Value(isFavorite),
      createDate: Value(createDate),
      lastUpdatedDate: Value(lastUpdatedDate),
    ).toColumns(nullToAbsent);
  }

  BoardEntity copyWith({required List<int> list}) {
    return BoardEntity(id: id,
        title: title,
        list:  list ,
        description: description,
        isFavorite: isFavorite,
        createDate: createDate,
        lastUpdatedDate: lastUpdatedDate);
  }
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is BoardEntity &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode ^ id.hashCode;
}