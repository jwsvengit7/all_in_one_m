import 'package:all_in_one_m/common/utils/image_manager.dart';
import 'package:all_in_one_m/common/utils/style_manager.dart';
import 'package:all_in_one_m/user/notification/user_notification_screen.dart';
import 'package:flutter/material.dart';

class CustomAppBarBtn extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final Color? titleColor;
  final String firstName;
  final bool showNotification;
  // final String? userAvatarUrl;

  const CustomAppBarBtn({
    Key? key,
    this.backgroundColor,
    this.titleColor,
    required this.firstName,
    this.showNotification = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading:
          false, // Set to false to remove the arrow back icon
      title: Row(
        children: [
          CircleAvatar(
            radius: 10,
            backgroundColor: StyleManager.avatarColor,
            backgroundImage: AssetImage(ImageManager.userAvatar),
          ),
          SizedBox(width: 8),
          Text(
            firstName,
            style: TextStyle(
              color: StyleManager.textColor,
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          Spacer(), //to push the notification icon to the right
        ],
      ),
      elevation: 0,
      backgroundColor: backgroundColor,
      actions: [
        if (showNotification)
          IconButton(
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
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
