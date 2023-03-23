
import 'package:equatable/equatable.dart';

import '../../data/local/entities/Item_entity.dart';

class ItemModel extends Equatable{
  final int id;
  final String title;
  final String description;
  final bool isImportant;
  final int listId;
  final int boardId;
  final String listName;
  final String boardName;
  final DateTime createdDate;
  final DateTime lastUpdateDate;

  const ItemModel( {
    required this.id,
    required this.listId,
    this.boardId = 0 ,
    this.listName ='',
    this.boardName ='',
    required this.title,
    required this.description,
    required this.isImportant,
    required this.createdDate,
    required this.lastUpdateDate
  });

  @override
  List<Object> get props => [id,description,boardId,boardName,listName,listId,title,isImportant,createdDate,lastUpdateDate];

  static ItemModel mapFromEntity(ItemWithBoards entity) {
    return ItemModel(
      id:  entity.item.id,
      title:  entity.item.title,
      isImportant: entity.item.isImportant,
      createdDate: entity.item.createDate,
      lastUpdateDate: entity.item.lastUpdatedDate,
      listId: entity.item.listId,
      description: entity.item.description,
      boardName: entity.boardName
    );
  }

  static ItemModel mapFromEntityL(ItemEntity entity) {
    return ItemModel(
      id:  entity.id,
      title:  entity.title,
      isImportant: entity.isImportant,
      createdDate: entity.createDate,
      lastUpdateDate: entity.lastUpdatedDate,
      listId: entity.listId,
      description: entity.description,
    );
  }

  ItemEntity toEntity(){
    return ItemEntity(
        id: id,
        listId: listId,
        title: title,
        description: description,
        isImportant: isImportant,
        createDate: createdDate,
        lastUpdatedDate: lastUpdateDate
    );
  }
  static List<ItemModel> mapFromListOfEntity(List<ItemWithBoards> entities){
    return entities.map((e) => mapFromEntity(e)).toList();
  }
  static List<ItemModel> mapFromListOfEntityL(List<ItemEntity> entities){
    return entities.map((e) => mapFromEntityL(e)).toList();
  }

}