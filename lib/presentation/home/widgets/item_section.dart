import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_models/home_cubits/item/item_cubit.dart';
import '../../../widgets/section_header.dart';
import 'item_row.dart';

class ItemSection extends StatelessWidget {
  const ItemSection({Key? key}) : super(key: key);

  void _navToTaskDetails(int taskId) {
    //TODO nav to TaskDetails
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemCubit, ItemState>(builder: (context, state) {
      if (state is ItemLoaded) {
        return Column(children: [
          SectionHeader(
              title: 'Recent Tasks',
              isSeeAllVisible: false),
          ListView.builder(
              itemCount: state.items.length,
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
