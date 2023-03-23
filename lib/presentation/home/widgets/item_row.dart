import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

import '../../../view_models/home_cubits/model/Item_ui.dart';

class ItemRow extends StatelessWidget {
  const ItemRow({Key? key, required this.item, required this.onTap})
      : super(key: key);

  final ItemUI item;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: GestureDetector(
        onTap: () {
          onTap(item.id);
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                      ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Row(
                    children: [
                      Text(
                        item.boardName,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Visibility(
                        visible: item.isImportant,
                        child: Container(
                          height: 8,
                          width: 8,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
