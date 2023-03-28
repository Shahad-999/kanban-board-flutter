import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kanban_board_flutter/presentation/splashScreen/widgets/logo.dart';
import '../../routing/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showOnBoarding = true;

  @override
  void initState() {
    super.initState();
    _checkIfFirstTime();
    _navToNextScreen();
  }

  _navToNextScreen(){
    Future.delayed(const Duration(milliseconds: 3000)).then((value) {
      if(_showOnBoarding){
        GoRouter.of(context).go(AppRouter.onBoardingRoute);
      }else{
        GoRouter.of(context).go(AppRouter.homeRoute);
      }
    });
  }

  @override
  void didChangeDependencies() {
    context.dependOnInheritedWidgetOfExactType();
    super.didChangeDependencies();
  }

  Future<void> _checkIfFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool openedBefore = prefs.getBool('openedBefore') ?? false;
    if (!openedBefore) {
      setState(() {
        _showOnBoarding = true;
      });
      prefs.setBool('openedBefore', true);
    } else {
      setState(() {
        _showOnBoarding = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const Center(
        child: Logo()
      ),
    );
  }
}
