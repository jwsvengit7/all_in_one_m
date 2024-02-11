import 'package:all_in_one_m/common/utils/style_manager.dart';
import 'package:all_in_one_m/components/bottom_navigation_bar.dart';
import 'package:all_in_one_m/components/wallet_button.dart';
import 'package:all_in_one_m/user/settings/wallet/user_bank_transfer.dart';
import 'package:all_in_one_m/user/settings/wallet/user_ussd.dart';
import 'package:flutter/material.dart';

class FundWallet extends StatefulWidget {
  FundWallet({Key? key}) : super(key: key);

  @override
  _FundWalletState createState() => _FundWalletState();
}

class _FundWalletState extends State<FundWallet> {
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
                  child: Text(
                    "Fund Wallet",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: StyleManager.textColor,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  child: FractionalTranslation(
                    translation: const Offset(0.0, 0.0),
                    child: Container(
                      width: 320,
                      height: 100,
                      decoration: BoxDecoration(
                        color: StyleManager.walletColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(9.0),
                          topRight: Radius.circular(9.0),
                        ),
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "₦12,000,000.00",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: StyleManager.textColor,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              "Current Balance",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: StyleManager.textColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 20),
                Container(
                  width: 320,
                  height: 100,
                  decoration: BoxDecoration(
                    color: StyleManager.whiteColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(9.0),
                      bottomRight: Radius.circular(9.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        spreadRadius: 0.3,
                        blurRadius: 2,
                        offset: Offset(0, 2.5),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                WalletButton(
                  buttonText: "Bank Transfer",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserBankTransfer()));
                  },
                ),
                SizedBox(height: 20),
                WalletButton(
                  buttonText: "USSD",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserBankUSSD()));
                    // Handle button press
                  },
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
