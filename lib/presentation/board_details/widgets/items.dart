import 'package:flutter/cupertino.dart';
import 'package:kanban_board_flutter/presentation/board_details/widgets/task_item.dart';

import '../../../view_models/board_details_cubit/lists_of_board_cubit.dart';

class Items extends StatelessWidget {
  const Items({Key? key, required this.items}) : super(key: key);
  final List<ItemUi> items;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return TaskItem(item: items[index]);
        });
  }
}
