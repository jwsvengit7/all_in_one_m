import 'package:all_in_one_m/common/utils/image_manager.dart';
import 'package:all_in_one_m/common/utils/style_manager.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final Color? titleColor;
  final VoidCallback? onBack;

  const CustomAppBar({
    Key? key,
    this.backgroundColor,
    this.titleColor,
    this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: StyleManager.backgroundColor,
      leading: IconButton(
        icon: Image.asset(ImageManager.arrowback),
        onPressed: onBack ?? () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
