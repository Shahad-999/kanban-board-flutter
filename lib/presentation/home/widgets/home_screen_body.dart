import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:size_config/size_config.dart';
import '../../../view_models/home_cubits/board/board_cubit.dart';
import '../../../view_models/home_cubits/item/item_cubit.dart';
import 'board_section.dart';
import 'empty_view.dart';
import 'item_section.dart';

class HomeScreenBody extends StatelessWidget {
  HomeScreenBody({Key? key}) : super(key: key);

  List<Widget> children = [const ItemSection(),const BoardSection()];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoardCubit, BoardState>(builder: (context, state) {
      if (state is BoardLoaded) {
        return ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: BlocBuilder<ItemCubit, ItemState>(
                  builder: (context, state) {
                    if (state is ItemEmpty) {
                      children.removeWhere((element) => element is ItemSection);
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: children,
                    );
                  },
                ),
              );
            });
      } else {
        return const EmptyView();
      }
    });
  }
}
