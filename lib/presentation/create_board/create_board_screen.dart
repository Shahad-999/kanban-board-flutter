import 'package:flutter/material.dart';
import 'package:kanban_board_flutter/presentation/create_board/widgets/create_board_body.dart';

import '../../widgets/navigation_app_bar.dart';

class CreateBoardScreen extends StatelessWidget {
  const CreateBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavigationAppBar( title:'Create Board'),
      body:  const CreateBoardBody(),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
