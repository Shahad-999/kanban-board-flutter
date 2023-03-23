import 'package:flutter/material.dart';

class AppFloatingActionButton extends StatelessWidget {
  const AppFloatingActionButton({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed ;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      backgroundColor: Theme.of(context).colorScheme.primary,
      onPressed: onPressed,
      child:  const Icon(
        Icons.add_rounded,
        size: 32,
      ),
    );
  }
}
