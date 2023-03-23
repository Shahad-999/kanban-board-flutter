import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:size_config/size_config.dart';

import '../../../../widgets/app_buttons.dart';
import '../../../../widgets/app_indicator.dart';
import '../../../../routing/routes.dart';
import 'on_boarding_pages.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({Key? key}) : super(key: key);

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  PageController? pageController;
  int pageCount = 3;

  @override
  void initState() {
    pageController = PageController(
        initialPage: 0
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  navToNextPage(){
    pageController?.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn
    );
  }
  navToPreviousPage(){
    pageController?.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut
    );
  }
  Future<bool> onPressBack(){
    if(pageController?.page != 0) {
      navToPreviousPage();
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onPressBack(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Stack(
          children:  [
            Positioned(
              top: 617.h,
              left: 56.w,
              right: 56.w,
              child: AppButton(
                isEnable: true,
                textButton: 'NEXT',
                onTap: navToNextPage,
              ),
            ),
            Positioned(
                top: 112.h,
                right: 16.w,
                child: GestureDetector(
                  onTap: () {
                    num currentPage = pageController!.hasClients  ? pageController?.page ?? 0 : 0;
                    if(currentPage < pageCount){
                      GoRouter.of(context).go(AppRouter.homeRoute);
                    }else{
                      null;
                    }
                  },
                  child: Text(
                    'SKIP',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                )
            ),
            Positioned(
                right: 0,
                left: 0,
                top: 170.h,
                child: OnBoardingPages(pageController: pageController!)
            ),
            Positioned(
                right: 0,
                left: 0,
                top: 520.h,
                child: AppIndicators(
                    dotsCount: pageCount,
                    currentPosition: pageController!.hasClients  ? pageController?.page?.roundToDouble() ?? 0.0 : 0.0
                )
            ),
          ],
        ),
      ),
    );
  }
}
