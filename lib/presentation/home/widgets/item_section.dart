import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_models/home_cubits/item/item_cubit.dart';
import '../../../widgets/section_header.dart';
import 'item_row.dart';

class ItemSection extends StatelessWidget {
  const ItemSection({Key? key}) : super(key: key);

   _navToClickSeeMore(BuildContext context) {
    context.read<ItemCubit>().clearItems();
    //TODO nav to see all task active
  }

  void _navToTaskDetails(int taskId) {
    //TODO nav to TaskDetails
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemCubit, ItemState>(builder: (context, state) {
      if (state is ItemLoaded) {
        return Column(children: [
          SectionHeader(
              title: 'Active Tasks',
              onClickSeeAll: (){_navToClickSeeMore(context);},
              isSeeAllVisible: true),
          ListView.builder(
              itemCount: state.items.take(3).length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return ItemRow(
                    item: state.items[index], onTap: _navToTaskDetails);
              })
        ]);
      } else {
        return Container();
      }
    });
  }
}
