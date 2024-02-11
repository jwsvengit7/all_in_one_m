import 'package:all_in_one_m/common/utils/style_manager.dart';
import 'package:all_in_one_m/components/small_custom_button.dart';
import 'package:all_in_one_m/config/enums.dart';
import 'package:all_in_one_m/shared/sign_up.dart';
import 'package:flutter/material.dart';

class DeactivateScreen extends StatelessWidget {
  final Function onDeactivate;

  DeactivateScreen({required this.onDeactivate});

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
                'Deactivate', // Corrected from 'Logout'
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Are you sure you want to deactivate \nyour account?',
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 10),
            SmallCustomButton(
              text: 'Deactivate',
              color: Colors.red,
              onPressed: () {
                onDeactivate();
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen(role:ROLE.ROLE_USER.name)),
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
