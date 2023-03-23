import 'package:flutter/cupertino.dart';
import 'package:kanban_board_flutter/presentation/onBoarding/widgets/on_boarding_page_view.dart';
import 'package:size_config/size_config.dart';

class OnBoardingPages extends StatelessWidget {
  const OnBoardingPages({Key? key, required this.pageController}) : super(key: key);

  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 350.h,
        child: PageView(
          controller: pageController,
          children: const [
            OnBoardingPageView(
                image: 'assets/svg/planing.svg',
                title: 'Planing'
            ),
            OnBoardingPageView(
                image: 'assets/svg/doing.svg',
                title: 'Doing'
            ),
            OnBoardingPageView(
                image: 'assets/svg/celebrate.svg',
                title: 'Celebrate'
            ),
          ],
        )
    );
  }
}
