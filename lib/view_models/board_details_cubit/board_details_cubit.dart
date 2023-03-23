import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use-cases/board_details_use_case.dart';
import '../../service_locator.dart';

part 'board_details_state.dart';

class BoardDetailsCubit extends Cubit<BoardDetailsState> {
  late final BoardDetailsUseCase boardDetailsUseCase;

  BoardDetailsCubit()
      : boardDetailsUseCase = getIt.get(),
        super(BoardDetailsInitial());

  void getBoard(int boardId) async {
    final boardDetails = await boardDetailsUseCase.getBoard(boardId);
    emit(BoardDetailsSuccessfully(boardId, boardDetails.title, boardDetails.description, boardDetails.isFavorite));
  }

  void onClickIsFavorite() {
    if (state is BoardDetailsSuccessfully) {
      var details = state as BoardDetailsSuccessfully;
      emit(details.copyWith(isFavorite: !details.isFavorite));
    }
  }
}
