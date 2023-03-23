import 'package:equatable/equatable.dart';

class ItemUI extends Equatable{

  final int id;
  final String title;
  final bool isImportant;
  final String boardName;

  const ItemUI(this.id, this.title, this.isImportant, this.boardName);
  @override
  List<Object?> get props => [id,title,isImportant,boardName];

}