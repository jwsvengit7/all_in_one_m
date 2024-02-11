import 'dart:convert';

import 'package:all_in_one_m/common/utils/style_manager.dart';
import 'package:all_in_one_m/components/bottom_navigation_bar.dart';
import 'package:all_in_one_m/components/wallet_button.dart';
import 'package:all_in_one_m/user/screens/user_dashboard.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

class UserBankTransfer extends StatefulWidget {
  UserBankTransfer({Key? key}) : super(key: key);

  @override
  _UserBankTransferState createState() => _UserBankTransferState();
}

class _UserBankTransferState extends State<UserBankTransfer> {
  int _selectedTabIndex = 2;
  String accountNumber = "";
  String bankName = "";

  // Function to fetch data from the API
  // Future<void> fetchData() async {
  //   final response = await http.get(Uri.parse('YOUR_API_ENDPOINT'));

  //   if (response.statusCode == 200) {
  //     // Parse the response JSON
  //     final data = json.decode(response.body);

  //     setState(() {
  //       // Assuming your API response has 'accountNumber' and 'bankName' fields
  //       accountNumber = data['accountNumber'];
  //       bankName = data['bankName'];
  //     });
  //   } else {
  //     // Handle error
  //     print('Failed to load data. Status code: ${response.statusCode}');
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   fetchData(); // Call fetchData when the widget is created
  // }

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
                        "Fund Wallet > > Bank Transfer",
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
                                "Make a transfer to your\nDedicated Virtual Account below to fund your wallet:\nAccount number $accountNumber Bank: $bankName",
                                style: TextStyle(
                                  fontSize: 26,
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
                    // Example: Assume transferSuccess is a boolean indicating if the transfer was successful
                    // bool transferSuccess = true; // Set this value based on your logic

                    // if (transferSuccess) {
                    //   _showSuccessPopup(); // Call a function to show the success popup
                    // } else {
                    //   // Handle the case when the transfer is not successful
                    //   // You can show an error message or handle it as needed
                    // }
                  },
                  textStyle: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: StyleManager.textColor,
                  ),
                ),
                SizedBox(height: 10),
                WalletButton(
                  buttonText: "Close",
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
