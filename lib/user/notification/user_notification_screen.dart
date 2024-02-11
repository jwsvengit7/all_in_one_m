import 'package:all_in_one_m/components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:all_in_one_m/common/utils/style_manager.dart';
import 'package:all_in_one_m/components/user_notification.dart';

class UserNotificationScreen extends StatelessWidget {
  final bool isSuccess;
  final double amount;

  UserNotificationScreen({required this.isSuccess, required this.amount});

  @override
  Widget build(BuildContext context) {
    Color scaffoldBackgroundColor = StyleManager.backgroundColor;

    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: CustomAppBar(
        backgroundColor: StyleManager.backgroundColor,
        titleColor: StyleManager.textColor,
      ),
      body: UserNotification(
        isSuccess: isSuccess,
        amount: amount,
      ),
    );
  }
}
