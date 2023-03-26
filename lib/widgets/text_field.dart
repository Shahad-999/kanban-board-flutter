import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

class GeneralTextField extends StatefulWidget {
  const GeneralTextField({Key? key, required this.maxLength, required this.maxLine, this.onChange, this.textController}) : super(key: key);

  final int maxLength;
  final int maxLine;
  final Function(String)? onChange;
  final TextEditingController? textController;
  @override
  State<GeneralTextField> createState() => _GeneralTextFieldState();
}

class _GeneralTextFieldState extends State<GeneralTextField> {
  int textLength =0;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textController,
      maxLength: widget.maxLength,
      maxLines: widget.maxLine,
      minLines: 1,
      decoration: InputDecoration(
          filled: true,
          suffix: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
                '${widget.maxLength-textLength}',
                style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
          counterText: "",
          fillColor: Theme.of(context).colorScheme.secondary,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none
          )
      ),
      style:  Theme.of(context).textTheme.bodyMedium?.copyWith(
        height: 1.3,
        fontSize: 13.sp,
        fontWeight: FontWeight.normal,
      ),
      onChanged: (value){
        widget.onChange!(value);
        setState(() {
          textLength = value.length;
        });
      },
      onTapOutside: (_){
        FocusScope.of(context).unfocus();
      },
    );
  }
}
