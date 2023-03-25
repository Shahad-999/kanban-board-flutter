// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $BoardsTable extends Boards with TableInfo<$BoardsTable, BoardEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BoardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isFavoriteMeta =
      const VerificationMeta('isFavorite');
  @override
  late final GeneratedColumn<bool> isFavorite =
      GeneratedColumn<bool>('isFavorite', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("isFavorite" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _createDateMeta =
      const VerificationMeta('createDate');
  @override
  late final GeneratedColumn<DateTime> createDate = GeneratedColumn<DateTime>(
      'createdDate', aliasedName, false,
      check: () => createDate.isBiggerThan(Constant(DateTime(1950))),
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _lastUpdatedDateMeta =
      const VerificationMeta('lastUpdatedDate');
  @override
  late final GeneratedColumn<DateTime> lastUpdatedDate =
      GeneratedColumn<DateTime>('lastUpdateDate', aliasedName, false,
          check: () => lastUpdatedDate.isBiggerThan(Constant(DateTime(1950))),
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, description, isFavorite, createDate, lastUpdatedDate];
  @override
  String get aliasedName => _alias ?? 'boards';
  @override
  String get actualTableName => 'boards';
  @override
  VerificationContext validateIntegrity(Insertable<BoardEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('isFavorite')) {
      context.handle(
          _isFavoriteMeta,
          isFavorite.isAcceptableOrUnknown(
              data['isFavorite']!, _isFavoriteMeta));
    }
    if (data.containsKey('createdDate')) {
      context.handle(
          _createDateMeta,
          createDate.isAcceptableOrUnknown(
              data['createdDate']!, _createDateMeta));
    }
    if (data.containsKey('lastUpdateDate')) {
      context.handle(
          _lastUpdatedDateMeta,
          lastUpdatedDate.isAcceptableOrUnknown(
              data['lastUpdateDate']!, _lastUpdatedDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BoardEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BoardEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      isFavorite: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}isFavorite'])!,
      createDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}createdDate'])!,
      lastUpdatedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}lastUpdateDate'])!,
    );
  }

  @override
  $BoardsTable createAlias(String alias) {
    return $BoardsTable(attachedDatabase, alias);
  }
}

class BoardsCompanion extends UpdateCompanion<BoardEntity> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<bool> isFavorite;
  final Value<DateTime> createDate;
  final Value<DateTime> lastUpdatedDate;
  const BoardsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.createDate = const Value.absent(),
    this.lastUpdatedDate = const Value.absent(),
  });
  BoardsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    this.isFavorite = const Value.absent(),
    this.createDate = const Value.absent(),
    this.lastUpdatedDate = const Value.absent(),
  })  : title = Value(title),
        description = Value(description);
  static Insertable<BoardEntity> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<bool>? isFavorite,
    Expression<DateTime>? createDate,
    Expression<DateTime>? lastUpdatedDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (isFavorite != null) 'isFavorite': isFavorite,
      if (createDate != null) 'createdDate': createDate,
      if (lastUpdatedDate != null) 'lastUpdateDate': lastUpdatedDate,
    });
  }

  BoardsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? description,
      Value<bool>? isFavorite,
      Value<DateTime>? createDate,
      Value<DateTime>? lastUpdatedDate}) {
    return BoardsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
      createDate: createDate ?? this.createDate,
      lastUpdatedDate: lastUpdatedDate ?? this.lastUpdatedDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isFavorite.present) {
      map['isFavorite'] = Variable<bool>(isFavorite.value);
    }
    if (createDate.present) {
      map['createdDate'] = Variable<DateTime>(createDate.value);
    }
    if (lastUpdatedDate.present) {
      map['lastUpdateDate'] = Variable<DateTime>(lastUpdatedDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BoardsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('createDate: $createDate, ')
          ..write('lastUpdatedDate: $lastUpdatedDate')
          ..write(')'))
        .toString();
  }
}

class $ListsTable extends Lists with TableInfo<$ListsTable, ListEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ListsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _boardIdMeta =
      const VerificationMeta('boardId');
  @override
  late final GeneratedColumn<int> boardId = GeneratedColumn<int>(
      'board_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES boards (id)'));
  static const VerificationMeta _createDateMeta =
      const VerificationMeta('createDate');
  @override
  late final GeneratedColumn<DateTime> createDate = GeneratedColumn<DateTime>(
      'createdDate', aliasedName, false,
      check: () => createDate.isBiggerThan(Constant(DateTime(1950))),
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _lastUpdatedDateMeta =
      const VerificationMeta('lastUpdatedDate');
  @override
  late final GeneratedColumn<DateTime> lastUpdatedDate =
      GeneratedColumn<DateTime>('lastUpdateDate', aliasedName, false,
          check: () => lastUpdatedDate.isBiggerThan(Constant(DateTime(1950))),
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, order, boardId, createDate, lastUpdatedDate];
  @override
  String get aliasedName => _alias ?? 'lists';
  @override
  String get actualTableName => 'lists';
  @override
  VerificationContext validateIntegrity(Insertable<ListEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    if (data.containsKey('board_id')) {
      context.handle(_boardIdMeta,
          boardId.isAcceptableOrUnknown(data['board_id']!, _boardIdMeta));
    } else if (isInserting) {
      context.missing(_boardIdMeta);
    }
    if (data.containsKey('createdDate')) {
      context.handle(
          _createDateMeta,
          createDate.isAcceptableOrUnknown(
              data['createdDate']!, _createDateMeta));
    }
    if (data.containsKey('lastUpdateDate')) {
      context.handle(
          _lastUpdatedDateMeta,
          lastUpdatedDate.isAcceptableOrUnknown(
              data['lastUpdateDate']!, _lastUpdatedDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ListEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ListEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      boardId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}board_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
      createDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}createdDate'])!,
      lastUpdatedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}lastUpdateDate'])!,
    );
  }

  @override
  $ListsTable createAlias(String alias) {
    return $ListsTable(attachedDatabase, alias);
  }
}

class ListsCompanion extends UpdateCompanion<ListEntity> {
  final Value<int> id;
  final Value<String> title;
  final Value<int> order;
  final Value<int> boardId;
  final Value<DateTime> createDate;
  final Value<DateTime> lastUpdatedDate;
  const ListsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.order = const Value.absent(),
    this.boardId = const Value.absent(),
    this.createDate = const Value.absent(),
    this.lastUpdatedDate = const Value.absent(),
  });
  ListsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required int order,
    required int boardId,
    this.createDate = const Value.absent(),
    this.lastUpdatedDate = const Value.absent(),
  })  : title = Value(title),
        order = Value(order),
        boardId = Value(boardId);
  static Insertable<ListEntity> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<int>? order,
    Expression<int>? boardId,
    Expression<DateTime>? createDate,
    Expression<DateTime>? lastUpdatedDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (order != null) 'order': order,
      if (boardId != null) 'board_id': boardId,
      if (createDate != null) 'createdDate': createDate,
      if (lastUpdatedDate != null) 'lastUpdateDate': lastUpdatedDate,
    });
  }

  ListsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<int>? order,
      Value<int>? boardId,
      Value<DateTime>? createDate,
      Value<DateTime>? lastUpdatedDate}) {
    return ListsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      order: order ?? this.order,
      boardId: boardId ?? this.boardId,
      createDate: createDate ?? this.createDate,
      lastUpdatedDate: lastUpdatedDate ?? this.lastUpdatedDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (boardId.present) {
      map['board_id'] = Variable<int>(boardId.value);
    }
    if (createDate.present) {
      map['createdDate'] = Variable<DateTime>(createDate.value);
    }
    if (lastUpdatedDate.present) {
      map['lastUpdateDate'] = Variable<DateTime>(lastUpdatedDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ListsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('order: $order, ')
          ..write('boardId: $boardId, ')
          ..write('createDate: $createDate, ')
          ..write('lastUpdatedDate: $lastUpdatedDate')
          ..write(')'))
        .toString();
  }
}

class $ItemsTable extends Items with TableInfo<$ItemsTable, ItemEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isImportantMeta =
      const VerificationMeta('isImportant');
  @override
  late final GeneratedColumn<bool> isImportant =
      GeneratedColumn<bool>('isImportant', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("isImportant" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _listIdMeta = const VerificationMeta('listId');
  @override
  late final GeneratedColumn<int> listId = GeneratedColumn<int>(
      'list_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES lists (id)'));
  static const VerificationMeta _createDateMeta =
      const VerificationMeta('createDate');
  @override
  late final GeneratedColumn<DateTime> createDate = GeneratedColumn<DateTime>(
      'createdDate', aliasedName, false,
      check: () => createDate.isBiggerThan(Constant(DateTime(1950))),
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _lastUpdatedDateMeta =
      const VerificationMeta('lastUpdatedDate');
  @override
  late final GeneratedColumn<DateTime> lastUpdatedDate =
      GeneratedColumn<DateTime>('lastUpdateDate', aliasedName, false,
          check: () => lastUpdatedDate.isBiggerThan(Constant(DateTime(1950))),
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        isImportant,
        listId,
        createDate,
        lastUpdatedDate
      ];
  @override
  String get aliasedName => _alias ?? 'items';
  @override
  String get actualTableName => 'items';
  @override
  VerificationContext validateIntegrity(Insertable<ItemEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('isImportant')) {
      context.handle(
          _isImportantMeta,
          isImportant.isAcceptableOrUnknown(
              data['isImportant']!, _isImportantMeta));
    }
    if (data.containsKey('list_id')) {
      context.handle(_listIdMeta,
          listId.isAcceptableOrUnknown(data['list_id']!, _listIdMeta));
    } else if (isInserting) {
      context.missing(_listIdMeta);
    }
    if (data.containsKey('createdDate')) {
      context.handle(
          _createDateMeta,
          createDate.isAcceptableOrUnknown(
              data['createdDate']!, _createDateMeta));
    }
    if (data.containsKey('lastUpdateDate')) {
      context.handle(
          _lastUpdatedDateMeta,
          lastUpdatedDate.isAcceptableOrUnknown(
              data['lastUpdateDate']!, _lastUpdatedDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ItemEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      listId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}list_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      isImportant: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}isImportant'])!,
      createDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}createdDate'])!,
      lastUpdatedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}lastUpdateDate'])!,
    );
  }

  @override
  $ItemsTable createAlias(String alias) {
    return $ItemsTable(attachedDatabase, alias);
  }
}

class ItemsCompanion extends UpdateCompanion<ItemEntity> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<bool> isImportant;
  final Value<int> listId;
  final Value<DateTime> createDate;
  final Value<DateTime> lastUpdatedDate;
  const ItemsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.isImportant = const Value.absent(),
    this.listId = const Value.absent(),
    this.createDate = const Value.absent(),
    this.lastUpdatedDate = const Value.absent(),
  });
  ItemsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    this.isImportant = const Value.absent(),
    required int listId,
    this.createDate = const Value.absent(),
    this.lastUpdatedDate = const Value.absent(),
  })  : title = Value(title),
        description = Value(description),
        listId = Value(listId);
  static Insertable<ItemEntity> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<bool>? isImportant,
    Expression<int>? listId,
    Expression<DateTime>? createDate,
    Expression<DateTime>? lastUpdatedDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (isImportant != null) 'isImportant': isImportant,
      if (listId != null) 'list_id': listId,
      if (createDate != null) 'createdDate': createDate,
      if (lastUpdatedDate != null) 'lastUpdateDate': lastUpdatedDate,
    });
  }

  ItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? description,
      Value<bool>? isImportant,
      Value<int>? listId,
      Value<DateTime>? createDate,
      Value<DateTime>? lastUpdatedDate}) {
    return ItemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isImportant: isImportant ?? this.isImportant,
      listId: listId ?? this.listId,
      createDate: createDate ?? this.createDate,
      lastUpdatedDate: lastUpdatedDate ?? this.lastUpdatedDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isImportant.present) {
      map['isImportant'] = Variable<bool>(isImportant.value);
    }
    if (listId.present) {
      map['list_id'] = Variable<int>(listId.value);
    }
    if (createDate.present) {
      map['createdDate'] = Variable<DateTime>(createDate.value);
    }
    if (lastUpdatedDate.present) {
      map['lastUpdateDate'] = Variable<DateTime>(lastUpdatedDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('isImportant: $isImportant, ')
          ..write('listId: $listId, ')
          ..write('createDate: $createDate, ')
          ..write('lastUpdatedDate: $lastUpdatedDate')
          ..write(')'))
        .toString();
  }
}

class $RecentItemsTable extends RecentItems
    with TableInfo<$RecentItemsTable, RecentItemEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecentItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<int> itemId = GeneratedColumn<int>(
      'item_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES items (id)'));
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<DateTime> time = GeneratedColumn<DateTime>(
      'time', aliasedName, false,
      check: () => time.isBiggerThan(Constant(DateTime(1950))),
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [itemId, time];
  @override
  String get aliasedName => _alias ?? 'recent_items';
  @override
  String get actualTableName => 'recent_items';
  @override
  VerificationContext validateIntegrity(Insertable<RecentItemEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  RecentItemEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecentItemEntity(
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_id'])!,
      time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}time'])!,
    );
  }

  @override
  $RecentItemsTable createAlias(String alias) {
    return $RecentItemsTable(attachedDatabase, alias);
  }
}

class RecentItemsCompanion extends UpdateCompanion<RecentItemEntity> {
  final Value<int> itemId;
  final Value<DateTime> time;
  final Value<int> rowid;
  const RecentItemsCompanion({
    this.itemId = const Value.absent(),
    this.time = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecentItemsCompanion.insert({
    required int itemId,
    this.time = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : itemId = Value(itemId);
  static Insertable<RecentItemEntity> custom({
    Expression<int>? itemId,
    Expression<DateTime>? time,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (itemId != null) 'item_id': itemId,
      if (time != null) 'time': time,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecentItemsCompanion copyWith(
      {Value<int>? itemId, Value<DateTime>? time, Value<int>? rowid}) {
    return RecentItemsCompanion(
      itemId: itemId ?? this.itemId,
      time: time ?? this.time,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (itemId.present) {
      map['item_id'] = Variable<int>(itemId.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecentItemsCompanion(')
          ..write('itemId: $itemId, ')
          ..write('time: $time, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $BoardsTable boards = $BoardsTable(this);
  late final $ListsTable lists = $ListsTable(this);
  late final $ItemsTable items = $ItemsTable(this);
  late final $RecentItemsTable recentItems = $RecentItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [boards, lists, items, recentItems];
}
