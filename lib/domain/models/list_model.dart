import 'package:equatable/equatable.dart';
import 'package:kanban_board_flutter/domain/models/item_model.dart';

import '../../data/local/entities/list_entity.dart';

class ListModel extends Equatable {
  final int id;
  final String title;
  final int order;
  final int boardId;
  final String boardName;
  final DateTime createdDate;
  final DateTime lastUpdateDate;
  final List<ItemModel> items;

  const ListModel({
    required this.id,
    required this.boardId,
    this.boardName = '',
    this.items = const [],
    required this.title,
    required this.order,
    required this.createdDate,
    required this.lastUpdateDate
  });

  @override
  List<Object> get props =>
      [
        id,
        boardId,
        boardName,
        items,
        title,
        order,
        createdDate,
        lastUpdateDate
      ];

  static ListModel mapFromEntity(ListEntity entity) {
    return ListModel(
      id: entity.id,
      title: entity.title,
      order: entity.order,
      items: ItemModel.mapFromListOfEntityL(entity.items),
      createdDate: entity.createDate,
      lastUpdateDate: entity.lastUpdatedDate,
      boardId: entity.boardId,
    );
  }

  ListEntity toEntity() {
    return ListEntity(id: id,
        boardId: boardId,
        title: title,
        order: order,
        createDate: createdDate,
        lastUpdatedDate: lastUpdateDate
    );
  }

  static List<ListModel> mapFromListOfEntity(List<ListEntity> entities) {
    return entities.map((e) => mapFromEntity(e)).toList();
  }

}