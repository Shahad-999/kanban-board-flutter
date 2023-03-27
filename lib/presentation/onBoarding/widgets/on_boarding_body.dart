import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:size_config/size_config.dart';
import '../../../routing/routes.dart';
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
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  navToNextPage() {
    num currentPage =
        pageController!.hasClients ? pageController?.page ?? 0 : 0;
    if (currentPage == pageCount - 1) {
      GoRouter.of(context).go(AppRouter.homeRoute);
    } else {
      pageController?.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    }
  }

  navToPreviousPage() {
    pageController?.previousPage(
        duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
  }

  Future<bool> onPressBack() {
    if (pageController?.page != 0) {
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
        body: Padding(
          padding: EdgeInsets.only(top: 0.h),
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: OnBoardingPages(pageController: pageController!))),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(24)),
                      child: Center(
                        child: TextButton(
                          onPressed: navToNextPage,
                          style: const ButtonStyle(
                            splashFactory: NoSplash.splashFactory,
                          ),
                          child: Text(
                            'Next',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
