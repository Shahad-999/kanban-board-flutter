part of 'create_board_cubit.dart';

class BoardInfoState {
  final String title;
  final String description;
  final bool isImportant;
  final List<String> list;
  final bool isButtonEnabled;

  BoardInfoState({
    this.title = '',
    this.description = '',
    this.isImportant = true,
    this.list = const ['TODO'],
    this.isButtonEnabled = false,
  });

  BoardInfoState copyWith({
    String? title,
    String? description,
    bool? isImportant,
    List<String>? list,
    bool? isButtonEnabled,
  }) {
    return BoardInfoState(
      title: title ?? this.title,
      description: description ?? this.description,
      isImportant: isImportant ?? this.isImportant,
      list: list ?? this.list,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
    );
  }
}
