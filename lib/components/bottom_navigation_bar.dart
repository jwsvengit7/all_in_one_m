import 'package:all_in_one_m/common/utils/style_manager.dart';
import 'package:all_in_one_m/user/card/link_nfc_card.dart';
import 'package:all_in_one_m/user/options/user_options.dart';
import 'package:all_in_one_m/user/screens/user_dashboard.dart';
import 'package:all_in_one_m/user/settings/security/security_view.dart';
import 'package:all_in_one_m/user/settings/user_setting.dart';
import 'package:all_in_one_m/user/settings/wallet/fund_wallet.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTabTapped;

  CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTabTapped,
  });

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: (index) {
        widget.onTabTapped(index);

        // Navigate to corresponding screens based on the selected tab
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserDashboard()),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LinkNFCCard()),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FundWallet()),
            );
            break;
          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserOptions()),
            );
            break;
          case 4:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserSetting()),
            );
            break;
        }
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: StyleManager.primaryColor,
      iconSize: 30,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.credit_card),
          label: 'Cards',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet),
          label: 'Wallet',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.window),
          label: 'Options',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
