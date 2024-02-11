import 'package:flutter/material.dart';
import 'package:all_in_one_m/common/utils/style_manager.dart';

class UserNotification extends StatelessWidget {
  final bool isSuccess;
  final double amount;

  UserNotification({required this.isSuccess, required this.amount});

  @override
  Widget build(BuildContext context) {
    IconData iconData = isSuccess ? Icons.check_circle : Icons.error;
    Color iconColor = isSuccess ? Colors.green : Colors.red;
    String statusText = isSuccess ? 'Successful' : 'Failed';
    

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: StyleManager.backgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                iconData,
                color: iconColor,
                size: 32,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  'Your purchased ticket of ₦$amount was $statusText and has been approved.',
                  style: TextStyle(
                    color: StyleManager.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
