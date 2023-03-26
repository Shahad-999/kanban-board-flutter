import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

import '../../../widgets/text_field.dart';

class InputView extends StatelessWidget {
  const InputView({Key? key, required this.inputTitle, required this.maxLength, required this.maxLines,  this.onChange, this.textField}) : super(key: key);
  final String inputTitle;
  final int maxLength;
  final int maxLines;
  final Function(String)? onChange;
  final Widget? textField;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        Text(
          inputTitle,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500
          ),
        ),
        SizedBox(height: 8.h),
        if(textField == null ) GeneralTextField(maxLength: maxLength,maxLine: maxLines,onChange: onChange) else textField!,
      ],
    );
  }
}
