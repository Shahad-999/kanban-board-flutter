part of 'board_details_cubit.dart';

abstract class BoardDetailsState {
}

class BoardDetailsInitial extends BoardDetailsState {
}

class BoardDetailsSuccessfully extends BoardDetailsState{
  final int boardId;
  final String title;
  final String description;
  final bool isFavorite;
  BoardDetailsSuccessfully(this.boardId, this.title, this.description, this.isFavorite);

  BoardDetailsSuccessfully copyWith({
    int? boardId,
    String? title,
    String? description,
    bool? isFavorite,
  }) {
    return BoardDetailsSuccessfully(
      boardId ?? this.boardId,
      title ?? this.title,
      description ?? this.description,
      isFavorite ?? this.isFavorite,
    );
  }
}
class BoardDeletedState extends BoardDetailsState {

}