import 'package:flutter/cupertino.dart';
import 'package:kanban_board_flutter/presentation/onBoarding/widgets/on_boarding_page_view.dart';
import 'package:size_config/size_config.dart';

class OnBoardingPages extends StatelessWidget {
  const OnBoardingPages({Key? key, required this.pageController})
      : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 420.h,
        child: PageView(
          controller: pageController,
          children: const [
            OnBoardingPageView(
              image: 'assets/svg/doing.svg',
              title: 'Welcome to our Kanban app!',
              description:
                  'Our app helps you manage your projects with ease. Use our Kanban board to stay on top of your tasks and visualize your progress.',
            ),
            OnBoardingPageView(
              image: 'assets/svg/board3.svg',
              title: 'Add Board',
              description:
                  'Create a board for your project. Add a title and description for your project.',
            ),
            OnBoardingPageView(
              image: 'assets/svg/board2.svg',
              title: ' Drag and Drop',
              description:
                  'Drag and drop cards to move them between lists. Move cards from "To Do" to "In Progress" when you are ready to start working on them.',
            ),
          ],
        ));
  }
}
