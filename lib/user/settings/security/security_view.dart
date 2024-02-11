import 'package:all_in_one_m/common/utils/style_manager.dart';
import 'package:all_in_one_m/components/bottom_navigation_bar.dart';
import 'package:all_in_one_m/components/custom_app_title.dart';
import 'package:all_in_one_m/components/setting_button.dart';
import 'package:all_in_one_m/user/screens/user_profile.dart';
import 'package:all_in_one_m/user/settings/security/transaction_pin/change_pin_screen.dart';
import 'package:flutter/material.dart';

class SecurityViewScreen extends StatefulWidget {
  @override
  _SecurityViewScreenState createState() => _SecurityViewScreenState();
}

class _SecurityViewScreenState extends State<SecurityViewScreen> {
  int _selectedTabIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarText(
          backgroundColor: StyleManager.backgroundColor,
          titleColor: StyleManager.textColor,
          onBack: () {
            Navigator.pop(context);
          },
          title: 'Security'),
      body: Container(
        color: StyleManager.backgroundColor,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 28.0, left: 28.0, top: 20),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SettingButton(
                      'Change Password',
                      Icons.arrow_circle_right,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserProfile()),
                        );
                      },
                    ),
                    SizedBox(height: 15),
                    SettingButton(
                      'Change Transaction PIN',
                      Icons.arrow_circle_right,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ChangeTransactionPinScreen()));
                        // Handle Change Transaction PIN button press
                      },
                    ),
                    SizedBox(height: 15),
                    SettingButton(
                      'Recover Transaction PIN',
                      Icons.arrow_circle_right,
                      onPressed: () {
                        // Handle Recover Transaction PIN button press
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedTabIndex,
        onTabTapped: (index) {
          setState(() {
            _selectedTabIndex = index;
          });
        },
      ),
    );
  }
}
