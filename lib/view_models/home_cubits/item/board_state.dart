
import '../model/board_ui.dart';


abstract class BoardState {}

class BoardInitial extends BoardState {}
class BoardEmpty extends BoardState{}
class BoardLoaded extends BoardState{
  final List<BoardUi> boards;

  BoardLoaded(this.boards);
}