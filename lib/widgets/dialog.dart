
import 'package:flutter/material.dart';

Future<void> showDeleteDialog(
    BuildContext context,
    VoidCallback onClickDelete,
    String title,
    String description,
    ) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        contentPadding: const EdgeInsets.all(24),
        title:  Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children:  <Widget>[
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: onClickDelete,
            child: const Text('Delete',style: TextStyle(color: Colors.red),),
          ),
        ],
      );
    },
  );
}