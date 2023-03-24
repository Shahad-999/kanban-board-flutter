import 'dart:io';

import 'package:drift/drift.dart';
import 'package:kanban_board_flutter/data/local/entities/recent_item_entity.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:drift/native.dart';

import 'entities/Item_entity.dart';
import 'entities/board_entity.dart';
import 'entities/list_entity.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Boards, Lists,Items,RecentItems])
class MyDatabase extends _$MyDatabase {

  MyDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;

}
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'kanban.db'));
    return NativeDatabase(file);
  });
}