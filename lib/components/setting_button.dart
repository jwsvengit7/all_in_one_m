import 'package:all_in_one_m/common/utils/style_manager.dart';
import 'package:flutter/material.dart';

class SettingButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  SettingButton(this.text, this.icon, {required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 10,
            offset: Offset(0, -0.8),
          ),
        ],
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          side: BorderSide.none,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 18, color: StyleManager.textColor),
            ),
            Icon(icon, color: StyleManager.textColor),
          ],
        ),
      ),
    );
  }
}
