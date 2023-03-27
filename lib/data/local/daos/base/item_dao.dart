

import '../../entities/Item_entity.dart';

abstract class ItemDao{


  Stream<List<ItemEntity>> getAllItem(int listId);
  Future<int>  addItem(ItemEntity item);
  Future deleteItem(int itemId);

  Future<int> moveItem(int itemId,int listId);
  Future<int> favoriteItem(int itemId,bool isImportant);
}