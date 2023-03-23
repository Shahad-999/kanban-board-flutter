


import '../../entities/list_entity.dart';

abstract class ListDao{

  Stream<List<ListEntity>> getAllList(int boardId);
  Future<int>  addList(ListEntity list);
  Future deleteList(int listId);

}