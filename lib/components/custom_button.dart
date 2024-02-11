import 'package:all_in_one_m/common/utils/style_manager.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  final double? width;
  final double? height;
  final double? borderRadius;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.fontSize,
    this.width,
    this.height,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 350.0,
      height: height ?? 70.0,
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color ?? StyleManager.primaryColor,
        borderRadius: BorderRadius.circular(9.0),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: color ?? StyleManager.primaryColor,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? StyleManager.textColor,
            fontSize: fontSize ?? 20.0,
            fontWeight: FontWeight.normal,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}
