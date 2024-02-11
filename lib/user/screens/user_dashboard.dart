import 'package:all_in_one_m/common/utils/image_manager.dart';
import 'package:all_in_one_m/common/utils/style_manager.dart';
import 'package:all_in_one_m/components/bottom_navigation_bar.dart';
import 'package:all_in_one_m/components/custom_app_bar.dart';
import 'package:all_in_one_m/user/settings/wallet/fund_wallet.dart';
import 'package:flutter/material.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({Key? key}) : super(key: key);

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int _selectedTabIndex = 0;

  Widget buildTicketCountWidget() {
    return Row(
      children: [
        SizedBox(width: 15),
        Image.asset(
          ImageManager.ticketIcon,
          width: 42,
          height: 42,
        ),
        SizedBox(width: 200),
        Text(
          '12',
          style: TextStyle(
            color: StyleManager.textColor,
            fontSize: 39,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    const double boxHeight = 140;
    const double boxWidth = 350;
    const double verticalSpacing = 4;

    Color scaffoldBackgroundColor = StyleManager.backgroundColor;

    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: CustomAppBarBtn(
        backgroundColor: scaffoldBackgroundColor,
        titleColor: StyleManager.textColor,
        firstName: 'Felix Akuta',
        showNotification: true,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: FractionalTranslation(
              translation: const Offset(0.0, 0.1),
              child: Container(
                height: boxHeight,
                width: boxWidth,
                decoration: BoxDecoration(
                  color: StyleManager.primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(9.0)),
                  boxShadow: [
                    BoxShadow(
                      color: StyleManager.primaryColor.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
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
                          Row(
                            children: [
                              Container(
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FundWallet()));
                                  },
                                  child: Text(
                                    'Fund Account +',
                                    style: TextStyle(
                                      color: StyleManager.textColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
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
                      SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Transaction History >>",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: StyleManager.textColor),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: verticalSpacing),
          Align(
            alignment: Alignment.topCenter,
            child: FractionalTranslation(
              translation: const Offset(0.0, 2.0),
              child: Container(
                height: 118,
                width: 338,
                decoration: BoxDecoration(
                  color: StyleManager.dashboardColor,
                  borderRadius: const BorderRadius.all(Radius.circular(9.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTicketCountWidget(),
                      SizedBox(height: 10),
                      Text(
                        'Number of tickets \npurchased',
                        style: TextStyle(
                          color: StyleManager.textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: verticalSpacing),
          Align(
            alignment: Alignment.topCenter,
            child: FractionalTranslation(
              translation: const Offset(0.0, 3.7),
              child: Container(
                height: 118,
                width: 338,
                decoration: BoxDecoration(
                  color: StyleManager.dashboardColor,
                  borderRadius: const BorderRadius.all(Radius.circular(9.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 0.2),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
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
