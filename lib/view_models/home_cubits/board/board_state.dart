part of 'board_cubit.dart';

@immutable
abstract class BoardState {}

class BoardInitial extends BoardState {}
class BoardEmpty extends BoardState{}
class BoardLoaded extends BoardState{
  final List<BoardUi> boards;

  BoardLoaded(this.boards);
}