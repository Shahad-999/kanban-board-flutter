
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kanban_board_flutter/presentation/board_details/board_details_screen.dart';
import 'package:kanban_board_flutter/presentation/create_board/create_board_screen.dart';
import 'package:kanban_board_flutter/presentation/onBoarding/on_boarding_screen.dart';

import '../presentation/edit_board/edit_board_screen.dart';
import '../presentation/home/home_screen.dart';
import '../presentation/splashScreen/splash_screen.dart';

class AppRouter{
    static const splashScreenRoute = '/splash_screen';
    static const onBoardingRoute = '/onBoarding_screen';
    static const homeRoute = '/home_screen';
    static const createBoardRoute = '/create_board_screen';
    static boardDetailsParam([String? id]) => '/board_details/${id ?? ':id'}';
    static editBoardParam([String? id]) => '/edit_board/${id ?? ':id'}';

    static Widget _homeRouteBuilder(BuildContext context, GoRouterState state) => const HomeScreen();
    static Widget _splashRouteBuilder(BuildContext context, GoRouterState state) => const SplashScreen();
    static Widget _onBoardingRouteBuilder(BuildContext context, GoRouterState state) => const OnBoardingScreen();
    static Widget _createBoardRouteBuilder(BuildContext context, GoRouterState state) => const CreateBoardScreen();
    static Widget _boardDetailsRouteBuilder(BuildContext context, GoRouterState state) =>  BoardDetailsScreen(boardId:state.params['id']!);
    static Widget _editBoardRouteBuilder(BuildContext context, GoRouterState state) =>  EditBoardScreen(boardId:state.params['id']!);


    static final GoRouter _router =
        GoRouter(
          initialLocation: splashScreenRoute,
          routes: [
              GoRoute(path: splashScreenRoute, builder: _splashRouteBuilder),
              GoRoute(path: onBoardingRoute, builder: _onBoardingRouteBuilder ),
              GoRoute(path: homeRoute, builder: _homeRouteBuilder),
              GoRoute(path: createBoardRoute, builder: _createBoardRouteBuilder),
              GoRoute(path: boardDetailsParam(), builder: _boardDetailsRouteBuilder),
              GoRoute(path: editBoardParam(), builder: _editBoardRouteBuilder),
            ],
        );
    static GoRouter get router => _router;

}