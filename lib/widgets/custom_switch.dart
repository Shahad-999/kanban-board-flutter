import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({Key? key, this.onChange}) : super(key: key);
  final Function(bool)? onChange;


  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool isImportant = true;

  @override
  Widget build(BuildContext context) {
    return  Switch(
      value: isImportant, onChanged: (bool value) {
        setState(() {
          isImportant = value;
        });
        if(widget.onChange!=null){
          widget.onChange!(isImportant);
        }

    },
      activeColor: Theme.of(context).colorScheme.primary,
    );
  }
}
