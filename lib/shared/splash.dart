import 'package:all_in_one_m/common/utils/image_manager.dart';
import 'package:all_in_one_m/constants/color_constants/ColorManager.dart';
import 'package:all_in_one_m/shared/landing_page.dart';
import 'package:flutter/material.dart';



class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetolandingpage();
  }

  _navigatetolandingpage() async {
    await Future.delayed(const Duration(milliseconds: 3500), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageManager.efu_Logo,
              width: 150,
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
