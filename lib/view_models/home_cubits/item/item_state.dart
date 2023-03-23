part of 'item_cubit.dart';

@immutable
abstract class ItemState {}

class ItemInitial extends ItemState {}
class ItemEmpty extends ItemState{}
class ItemLoaded extends ItemState{
  final List<ItemUI> items;

  ItemLoaded(this.items);
}
