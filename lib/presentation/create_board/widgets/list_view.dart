import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.listTitle, required this.onChange}) : super(key: key);

  final String listTitle;
  final Function(String) onChange;
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: listTitle);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.secondary
        ),
        width: double.infinity,
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
              children: [
                Expanded(
                  child: TextField(
                    maxLines: 1,
                    maxLength: 25,
                    controller: controller,
                    decoration: const InputDecoration(
                        counterText: "",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none
                      )
                    ),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.normal
                    ),
                    onTapOutside:(_){
                      onChange(controller.text);
                      controller.clear();
                    },
                  ),
                ),
                Icon(
                  Icons.drag_indicator,
                  color: Theme.of(context).colorScheme.tertiary,
                )

              ],
            ),
        ),
        ),

    );
  }
}
