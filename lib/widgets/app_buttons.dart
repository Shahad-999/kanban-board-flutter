import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

class AppButton extends StatelessWidget {
  const AppButton({Key? key, required this.onTap, required this.textButton, required this.isEnable}) : super(key: key);
  final VoidCallback onTap;
  final bool isEnable;
  final String textButton;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: isEnable ? () {
        onTap();
      } : null,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            color: isEnable ? Theme.of(context).colorScheme.primary : Theme.of(context).disabledColor ,
            borderRadius: BorderRadius.circular(8)
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              textButton,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp
              ),
            ),
          ),
        ),
      ),
    );
  }
}
