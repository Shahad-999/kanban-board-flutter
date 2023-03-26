


import '../../entities/list_entity.dart';

abstract class ListDao{

  Stream<List<ListEntity>> getAllList(int boardId);
  Future<int>  addList(ListEntity list);
  Future<int>  updateList(int listId,int order);
  Future<int>  updateListTitle(int listId,String title);
  Future deleteList(int listId);

}