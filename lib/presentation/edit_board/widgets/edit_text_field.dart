import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

class EditTextField extends StatefulWidget {
  const EditTextField({Key? key, required this.maxLength, required this.maxLine,required this.onChange, required this.textEditingController}) : super(key: key);

  final int maxLength;
  final int maxLine;
  final Function(String) onChange;
  final TextEditingController textEditingController;
  @override
  State<EditTextField> createState() => _EditTextFieldState();
}

class _EditTextFieldState extends State<EditTextField> {
  FocusNode inputNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 4,
      shadowColor: Theme.of(context).colorScheme.background,
      child: FocusScope(
        onFocusChange: (foucs){
          if(!foucs){
            widget.onChange(widget.textEditingController.text);
          }
        },
        child: TextField(
          focusNode: inputNode,
          controller: widget.textEditingController,
          maxLength: widget.maxLength,
          maxLines: widget.maxLine,
          minLines: 1,
          decoration: InputDecoration(
              filled: true,
              suffixIcon: Visibility(
                  visible: !inputNode.hasFocus,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: IconButton(
                      onPressed: (){
                        setState(() {
                          FocusScope.of(context).requestFocus(inputNode);
                        });
                      },
                      icon :  Icon(
                          Icons.edit,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  )
              ),

              counterText: "",
              fillColor: Theme.of(context).colorScheme.background,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:  BorderSide(color: Theme.of(context).colorScheme.outline),
              ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:  BorderSide(color: Theme.of(context).colorScheme.outline),
            ),
          ),
          style:  Theme.of(context).textTheme.bodyMedium?.copyWith(
            height: 1.3,
            fontSize: 13.sp,
            fontWeight: FontWeight.normal,
          ),
          onSubmitted: (value){
            widget.onChange(value);
          },
          onTapOutside: (_){
            setState(() {
              FocusScope.of(context).unfocus();
            });
          },
        ),
      ),
    );
  }
}
