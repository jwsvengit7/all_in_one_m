import 'package:all_in_one_m/common/utils/style_manager.dart';
import 'package:all_in_one_m/components/small_custom_button.dart';
import 'package:all_in_one_m/shared/login_screen.dart'; // Import the LoginScreen
import 'package:flutter/material.dart';

class LogoutScreen extends StatelessWidget {
  final Function onLogout;

  LogoutScreen({required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: StyleManager.backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Are you sure you want to logout of \nyour account?',
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 10),
            SmallCustomButton(
              text: 'Logout',
              color: Colors.red,
              onPressed: () {
                onLogout();
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
            SizedBox(height: 12),
            SmallCustomButton(
              text: 'Cancel',
              color: Colors.grey,
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        ),
      ),
    );
  }
}
