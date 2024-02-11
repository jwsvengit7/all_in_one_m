import 'package:all_in_one_m/config/enums.dart';
import 'package:all_in_one_m/shared/login_screen.dart';
import 'package:all_in_one_m/shared/sign_up.dart';
import 'package:all_in_one_m/constants/color_constants/ColorManager.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.bgColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 100, 40, 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Get Started",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const Text(
              "Empower your financial journey with efu. Where innovation meets simplicity, your financial future begins",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: 500.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: const Color(0xFFFF914C),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen(role: ROLE.ROLE_USER.name)),
                  );
                },
                child: const Text(
                  'Create New User Account',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: 500.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: const Color(0xFFFF914C),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen(role:ROLE.ROLE_MERCHANT.name)),
                  );
                },
                child: const Text(
                  'Create New Merchant Account',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: 500.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: const Color(0xFFFF914C),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
