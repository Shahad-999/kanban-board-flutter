import 'package:get_it/get_it.dart';
import 'package:kanban_board_flutter/data/kanban_repository.dart';
import 'package:kanban_board_flutter/data/local/daos/base/board_dao.dart';
import 'package:kanban_board_flutter/data/local/daos/base/item_dao.dart';
import 'package:kanban_board_flutter/data/local/daos/base/list_dao.dart';
import 'package:kanban_board_flutter/data/local/daos/driftImp/List_dao_drift_imp.dart';
import 'package:kanban_board_flutter/data/local/daos/driftImp/board_dao_drift_imp.dart';
import 'package:kanban_board_flutter/data/local/daos/driftImp/item_dao_drift_imp.dart';
import 'package:kanban_board_flutter/data/local/database.dart';
import 'package:kanban_board_flutter/domain/kanban_board_repository.dart';
import 'package:kanban_board_flutter/domain/use-cases/favorite_boards_use_case.dart';
import 'package:kanban_board_flutter/domain/use-cases/board_details_use_case.dart';
import 'package:kanban_board_flutter/domain/use-cases/boards_use_case.dart';
import 'package:kanban_board_flutter/domain/use-cases/edit_board_use_case.dart';
import 'package:kanban_board_flutter/domain/use-cases/delete_item_use_case.dart';
import 'domain/use-cases/create_board_use_case.dart';
import 'domain/use-cases/create_item_use_case.dart';
import 'domain/use-cases/create_list_use_case.dart';
import 'domain/use-cases/edit_list_use_case.dart';

GetIt getIt = GetIt.instance;

setup() {
  getIt.registerSingleton<MyDatabase>(MyDatabase());
  getIt.registerSingleton<BoardDao>(BoardDrfitImp());
  getIt.registerSingleton<ListDao>(ListDriftImp());
  getIt.registerSingleton<ItemDao>(ItemDriftImp());
  getIt.registerSingleton<KanbanRepository>(KanbanRepositoryImp());
  getIt.registerSingleton<FavoriteBoardsUseCase>(FavoriteBoardsUseCase());
  getIt.registerSingleton<BoardsUseCase>(BoardsUseCase());
  getIt.registerSingleton<CreateBoardUseCase>(CreateBoardUseCase());
  getIt.registerSingleton<CreateListUseCase>(CreateListUseCase());
  getIt.registerSingleton<BoardDetailsUseCase>(BoardDetailsUseCase());
  getIt.registerSingleton<CreateItemUseCase>(CreateItemUseCase());
  getIt.registerSingleton<DeleteItemsUseCase>(DeleteItemsUseCase());
  getIt.registerSingleton<EditBoardUseCase>(EditBoardUseCase());
  getIt.registerSingleton<EditListUseCase>(EditListUseCase());
}
