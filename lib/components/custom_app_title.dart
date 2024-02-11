import 'package:all_in_one_m/common/utils/image_manager.dart';
import 'package:flutter/material.dart';

class CustomAppBarText extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final Color titleColor;
  final VoidCallback? onBack;
  final String title;

  CustomAppBarText({
    required this.backgroundColor,
    required this.titleColor,
    this.onBack,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      leading: onBack != null
          ? IconButton(
              icon: Image.asset(ImageManager.arrowback),
              onPressed: onBack!,
            )
          : null,
      title: Text(
        title,
        style: TextStyle(
          color: titleColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
