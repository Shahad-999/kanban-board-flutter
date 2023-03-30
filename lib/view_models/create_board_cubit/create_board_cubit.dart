import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board_flutter/domain/models/board_model.dart';
import 'package:kanban_board_flutter/service_locator.dart';

import '../../../domain/models/list_model.dart';
import '../../../domain/use-cases/create_board_use_case.dart';
import '../../../domain/use-cases/create_list_use_case.dart';

part 'create_board_state.dart';

class CreateBoardCubit extends Cubit<BoardInfoState> {
  late final CreateBoardUseCase createBoardUseCase;
  late final CreateListUseCase createListUseCase;

  CreateBoardCubit()
      : createBoardUseCase = getIt.get(),
        createListUseCase = getIt.get(),
        super(BoardInfoState());

  void updateTitle(String title) {
    emit(state.copyWith(
        title: title, isButtonEnabled: getButtonState(title: title)));
  }

  void updateDescription(String description) {
    emit(state.copyWith(
        description: description,
        isButtonEnabled: getButtonState(description: description)));
  }

  void updateIsImportant(bool isImportant) {
    emit(state.copyWith(isImportant: isImportant));
  }

  void addItemToList() {
    emit(state.copyWith(list: state.list..add("New List")));
  }

  void deleteItemFromList(int index) {
    emit(state.copyWith(list: state.list.toList()..removeAt(index)));
  }

  void updateItemInList(int index, String value) {
    final updatedList = List<String>.from(state.list);
    updatedList[index] = value;
    emit(state.copyWith(list: updatedList));
  }

  Future<void> createBoard() async {
    final boardId = await createBoardUseCase.createBoard(BoardModel(
        id: 0,
        title: state.title,
        description: state.description,
        isFavorite: state.isImportant,
        createdDate: DateTime.now(),
        lastUpdateDate: DateTime.now()));

     state.list.asMap().forEach((index, value) async {
      await createListUseCase.createList(ListModel(
          id: 0,
          boardId: boardId,
          title: value,
          order: index,
          createdDate: DateTime.now(),
          lastUpdateDate: DateTime.now())); //TODO LATER SAVED LISTS OF LIST
    });
  }

  void reorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) newIndex -= 1;
    final item = state.list.removeAt(oldIndex);
    state.list.insert(newIndex, item);
    emit(state.copyWith(list: state.list));
  }

  bool getButtonState({String? title, String? description}) =>
      (title ?? state.title).isNotEmpty &&
      (description ?? state.description).isNotEmpty;
}
