import 'package:all_in_one_m/common/utils/style_manager.dart';
import 'package:all_in_one_m/common/utils/image_manager.dart';
import 'package:all_in_one_m/user/notification/user_notification_screen.dart';
import 'package:flutter/material.dart';

class CustomAppBarWithNotification extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final VoidCallback onNotificationPressed;
  final bool showNotification;

  CustomAppBarWithNotification({
    required this.title,
    required this.onNotificationPressed,
    required this.showNotification,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: StyleManager.backgroundColor,
      title: Text(
        title,
        style: TextStyle(
          color: StyleManager.textColor,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        if (showNotification)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Image.asset(
                ImageManager.notification,
                width: 24,
                height: 24,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserNotificationScreen(
                      isSuccess: true,
                      amount: 100.0,
                    ),
                  ),
                );
              },
            ),
          ),
      ],
      centerTitle: true,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
