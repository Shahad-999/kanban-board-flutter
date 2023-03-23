part of 'lists_of_board_cubit.dart';


class ListUi{
  final int id;
  final String title;
  final int order;
  final List<ItemUi> items;

  ListUi(this.id, this.title, this.order, this.items);

  static ListUi fromModel(ListModel model){
    return ListUi(model.id, model.title, model.order, ItemUi.fromModels(model.items));
  }


  static List<ListUi> fromModels(List<ListModel> models){
    return models.map((e) => fromModel(e)).toList();
  }
}
class ItemUi{
  final int id;
  final String title;
  final bool isImportant;
  final int listId;

  ItemUi(this.id, this.title, this.isImportant, this.listId);

  static ItemUi fromModel(ItemModel model){
    return ItemUi(model.id, model.title, model.isImportant, model.listId);
  }

  static List<ItemUi> fromModels(List<ItemModel> models){
    return models.map((e) => fromModel(e)).toList();
  }
}