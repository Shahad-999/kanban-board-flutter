import 'package:equatable/equatable.dart';

import '../../data/local/entities/board_entity.dart';

class BoardModel extends Equatable {
  final int id;
  final String title;
  final String description;
  final bool isFavorite;
  final List<int> lists;
  final DateTime createdDate;
  final DateTime lastUpdateDate;

  const BoardModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isFavorite,
    this.lists = const [],
    required this.createdDate,
    required this.lastUpdateDate});

  @override
  List<Object> get props =>
      [id, title, isFavorite, lists,createdDate, lastUpdateDate];

  static BoardModel mapFromEntity(BoardEntity entity) {
    return BoardModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      lists: entity.list,
      isFavorite: entity.isFavorite,
      createdDate: entity.createDate,
      lastUpdateDate: entity.lastUpdatedDate,
    );
  }

  BoardEntity toEntity() {
    return BoardEntity(id: id,
        title: title,
        description: description,
        isFavorite: isFavorite,
        createDate: createdDate,
        lastUpdatedDate: lastUpdateDate
    );
  }

  static List<BoardModel> mapFromListOfEntity(List<BoardEntity> entities) {
    return entities.map((e) => mapFromEntity(e)).toList();
  }
}