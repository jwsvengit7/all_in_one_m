import 'package:all_in_one_m/common/utils/style_manager.dart';
import 'package:all_in_one_m/components/app_bar_with_notification.dart';
import 'package:all_in_one_m/components/bottom_navigation_bar.dart';
import 'package:all_in_one_m/components/setting_button.dart';
import 'package:all_in_one_m/config/enums.dart';
import 'package:all_in_one_m/popups/delete_account_popup.dart';
import 'package:all_in_one_m/popups/logout.dart';
import 'package:all_in_one_m/shared/login_screen.dart';
import 'package:all_in_one_m/shared/sign_up.dart';
import 'package:all_in_one_m/user/screens/user_profile.dart';
import 'package:all_in_one_m/user/settings/security/security_view.dart';
import 'package:all_in_one_m/user/settings/wallet/fund_wallet.dart';
import 'package:flutter/material.dart';

class UserSetting extends StatefulWidget {
  @override
  _UserSettingState createState() => _UserSettingState();
}

class _UserSettingState extends State<UserSetting> {
  int _selectedTabIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithNotification(
        title: 'Settings',
        onNotificationPressed: () {},
        showNotification: true,
      ),
      body: Container(
        color: StyleManager.backgroundColor,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 28.0, left: 28.0, top: 10),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SettingButton(
                      'Profile',
                      Icons.person,
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
                      'Wallet',
                      Icons.account_balance_wallet,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FundWallet()));
                      },
                    ),
                    SizedBox(height: 15),
                    SettingButton(
                      'Transfer',
                      Icons.account_balance,
                      onPressed: () {},
                    ),
                    SizedBox(height: 15),
                    SettingButton(
                      'Security',
                      Icons.security,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecurityViewScreen()),
                        );
                      },
                    ),
                    SizedBox(height: 15),
                    SettingButton(
                      'Complaint',
                      Icons.warning,
                      onPressed: () {},
                    ),
                    SizedBox(height: 15),
                    SettingButton(
                      'Support Center',
                      Icons.live_help,
                      onPressed: () {},
                    ),
                    SizedBox(height: 15),
                    SettingButton(
                      'Terms and Conditions',
                      Icons.description,
                      onPressed: () {},
                    ),
                    SizedBox(height: 15),
                    SettingButton(
                      'Privacy Policy',
                      Icons.privacy_tip,
                      onPressed: () {},
                    ),
                    SizedBox(height: 15),
                    SettingButton(
                      'Logout',
                      Icons.exit_to_app,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return LogoutScreen(
                              onLogout: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(height: 15),
                    SettingButton(
                      'Deactivate Account',
                      Icons.delete,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return DeactivateScreen(
                              onDeactivate: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpScreen(role:ROLE.ROLE_USER.name),
                                  ),
                                );
                              },
                            );
                          },
                        );
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
