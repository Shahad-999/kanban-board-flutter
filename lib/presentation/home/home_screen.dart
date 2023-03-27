import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kanban_board_flutter/presentation/home/widgets/home_screen_body.dart';
import '../../view_models/home_cubits/board/board_cubit.dart';
import '../../view_models/home_cubits/item/favorite_board_cubit.dart';
import '../../widgets/floating_action_buttons.dart';
import '../../widgets/general_app_bar.dart';
import '../../routing/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  _navToCreateBoardScreen(BuildContext context){
    GoRouter.of(context).push(AppRouter.createBoardRoute);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const GeneralAppBar(),
      body: MultiBlocProvider(
          providers: [
            BlocProvider<BoardCubit>(create: (BuildContext context) => BoardCubit()),
            BlocProvider<FavoriteBoardsCubit>(create: (BuildContext context) => FavoriteBoardsCubit())
          ],
          child: HomeScreenBody()
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: AppFloatingActionButton(
        onPressed:  () { _navToCreateBoardScreen(context); },
      )
    );
  }
}
