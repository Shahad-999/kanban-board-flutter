

import '../../../domain/models/item_model.dart';
import '../model/Item_ui.dart';

extension ItemMapper on ItemModel{
  ItemUI toUiModel() => ItemUI(id, title, isImportant, boardName); //board name not correct
}

extension ItemListMapper on List<ItemModel>{
  List<ItemUI> toUiModel() => map((e) => e.toUiModel()).toList(); //board name not correct
}