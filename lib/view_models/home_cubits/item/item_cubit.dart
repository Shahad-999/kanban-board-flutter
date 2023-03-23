import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:kanban_board_flutter/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board_flutter/view_models/home_cubits/mappers/item_ui_mapper.dart';
import '../../../../domain/use-cases/active_item_use_case.dart';
import '../model/Item_ui.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  late final StreamSubscription _subscription;
  final ActiveItemsUseCase activeItemsUseCase;
  final int limitActiveInHome = 3;

  ItemCubit()
      : activeItemsUseCase = getIt.get(),
        super(ItemInitial()) {
    _subscribe();
  }

  clearItems() {
    emit(ItemEmpty());
  }

  _subscribe() {
    _subscription = activeItemsUseCase.getActiveItems(limitActiveInHome).listen(
      (items) {
        print(items);
        if (items.isEmpty) {
          emit(ItemEmpty());
        } else {
          emit(ItemLoaded(items.toUiModel()));
        }
      },
    );
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
