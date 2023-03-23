
import 'package:kanban_board_flutter/domain/models/board_model.dart';

import '../model/board_ui.dart';

const colors = [0xFF3C7FC2,0xFF47DAD1,0xFF45EA73,0xFF45EA73];
extension BoardMapper on BoardModel{
  BoardUi toUiModel() => BoardUi(id, title,description, lists, colors.take(lists.length).toList()); //lists  && description not correct
}

extension BoardListMapper on List<BoardModel>{
  List<BoardUi> toUiModel() => map((e) => e.toUiModel()).toList();
}