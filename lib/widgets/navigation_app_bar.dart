import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:size_config/size_config.dart';

class NavigationAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String? title;
  final List<Widget>? actions;
  const NavigationAppBar({Key? key, this.title, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        icon : Icon(
          Icons.arrow_back,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        onPressed: () { GoRouter.of(context).pop(); },
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      title: title != null ? Text(
          title!,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.normal,
          ),
      ) : null ,
      actions: actions,
      elevation: 0.5,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
