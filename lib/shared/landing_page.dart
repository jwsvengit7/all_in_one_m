import 'package:all_in_one_m/common/utils/image_manager.dart';
import 'package:all_in_one_m/constants/animations_contants/AnimationManager.dart';
import 'package:all_in_one_m/constants/color_constants/ColorManager.dart';
import 'package:all_in_one_m/shared/Get_Started.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              ImageManager.efuLogo,
              fit: BoxFit.cover,
              height: 170,
              width: 170,
            ),
            const SizedBox(height: 10),
            Image.asset(ImageManager.qrcode),
            // Image.asset(name)
            // qrc.png
            // Lottie.asset(AnimationManager.efuBus, height: 300, width: 300),
            const SizedBox(height: 40),
            Container(
              width: 300.0,
              height: 60.0,
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: ColorManager.primaryColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GetStarted()),
                  );
                },
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
