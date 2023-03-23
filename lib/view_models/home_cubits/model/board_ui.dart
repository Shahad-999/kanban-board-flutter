
import 'package:equatable/equatable.dart';

class BoardUi extends Equatable{
  final int id;
  final String title;
  final String description;
  final List<int> numberItemInEachList;
  final List<int> listColor;

  const BoardUi(this.id, this.title, this.description, this.numberItemInEachList, this.listColor);

  @override
  List<Object?> get props => [id,title,description,numberItemInEachList];

}