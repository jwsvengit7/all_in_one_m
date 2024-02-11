import 'package:all_in_one_m/common/utils/style_manager.dart';
import 'package:all_in_one_m/components/app_bar_with_notification.dart';
import 'package:all_in_one_m/components/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class LinkNFCCard extends StatefulWidget {
  LinkNFCCard({Key? key}) : super(key: key);

  @override
  _LinkNFCCardtState createState() => _LinkNFCCardtState();
}

class _LinkNFCCardtState extends State<LinkNFCCard> {
  int _selectedTabIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithNotification(
        title: 'Link NFC Card',
        onNotificationPressed: () {},
        showNotification: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 900,
          color: StyleManager.backgroundColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Align(
                  child: FractionalTranslation(
                    translation: const Offset(0.0, 0.0),
                    child: Container(
                      width: 320,
                      height: 100,
                      decoration: BoxDecoration(
                        color: StyleManager.primaryColor,
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
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Available Balance',
                                      style: TextStyle(
                                        color: StyleManager.textColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Icon(
                                      Icons.remove_red_eye,
                                      color: StyleManager.textColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '₦12,000,000.00',
                                  style: TextStyle(
                                    color: StyleManager.textColor,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w900,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
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
                SizedBox(height: 40),
                Container(
                  width: 320,
                  height: 300,
                  decoration: BoxDecoration(
                    color: StyleManager.dashboardColor,
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
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: 'Enter a valid card number',
                                      labelStyle: TextStyle(
                                        color: StyleManager.hintColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    style: TextStyle(
                                      color: StyleManager.hintColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 27,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: StyleManager.primaryColor,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.7),
                                        spreadRadius: 0.3,
                                        blurRadius: 2,
                                        offset: Offset(0, 2.5),
                                      ),
                                    ],
                                  ),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Scan QR Code',
                                      style: TextStyle(
                                        color: StyleManager.whiteColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                          ],
                        ),
                        FractionalTranslation(
                          translation: Offset(-0.3, -2.8),
                          child: Container(
                            height: 3,
                            width: 170,
                            color: StyleManager.whiteColor,
                          ),
                        ),
                        SizedBox(height: 30),
                        Row(children: [
                          Container(
                            height: 60,
                            width: 270,
                            decoration: BoxDecoration(
                              color: StyleManager.primaryColor,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.7),
                                  spreadRadius: 0.3,
                                  blurRadius: 2,
                                  offset: Offset(0, 2.5),
                                ),
                              ],
                            ),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Link card',
                                style: TextStyle(
                                  color: StyleManager.whiteColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                ),
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
