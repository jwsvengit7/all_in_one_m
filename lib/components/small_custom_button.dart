import 'package:flutter/material.dart';

class SmallCustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPressed;
  final double width;
  final double height;
  final Color textColor;
  final double fontSize;

  SmallCustomButton({
    required this.text,
    required this.color,
    required this.onPressed,
    this.width = 300.0,
    this.height = 60.0,
    this.textColor = Colors.white,
    this.fontSize = 18.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      // margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(17.0),
      ),
      child: TextButton(
        onPressed: onPressed as void Function()?,
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: FontWeight.normal,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}
