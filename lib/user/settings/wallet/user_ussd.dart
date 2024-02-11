import 'package:all_in_one_m/common/utils/style_manager.dart';
import 'package:all_in_one_m/components/bottom_navigation_bar.dart';
import 'package:all_in_one_m/components/wallet_button.dart';
import 'package:all_in_one_m/user/screens/user_dashboard.dart';
import 'package:flutter/material.dart';

class UserBankUSSD extends StatefulWidget {
  UserBankUSSD({Key? key}) : super(key: key);

  @override
  _UserBankUSSDState createState() => _UserBankUSSDState();
}

class _UserBankUSSDState extends State<UserBankUSSD> {
  int _selectedTabIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 900,
          color: StyleManager.primaryColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Column(
                    children: [
                      Text(
                        "Fund Wallet",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: StyleManager.textColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Fund Wallet > > USSD",
                        style: TextStyle(
                            fontSize: 20,
                            color: StyleManager.textColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  child: FractionalTranslation(
                    translation: const Offset(0.0, 0.0),
                    child: Container(
                      width: 320,
                      height: 300,
                      decoration: BoxDecoration(
                        color: StyleManager.walletColor,
                        borderRadius: BorderRadius.all(Radius.circular(9.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            spreadRadius: 0.3,
                            blurRadius: 2,
                            offset: Offset(0, 2.5),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Dial the following code\nFrom your registered One Code\nPhone Number",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Poppins',
                                  color: StyleManager.textColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 40),
                              Text(
                                "Dail *5127*123*1234*Amount#",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Poppins',
                                  color: StyleManager.textColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                WalletButton(
                  buttonText: "Done",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserDashboard()));
                  },
                  textStyle: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: StyleManager.textColor,
                  ),
                )
              ],
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
