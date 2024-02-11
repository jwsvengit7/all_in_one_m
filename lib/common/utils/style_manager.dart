import 'package:flutter/material.dart';

class StyleManager {
  //Colors
  static const Color primaryColor = Color(0xFFFF914C);
  static const Color backgroundColor = Color(0xFFFDFDFD);
  static const Color textColor = Color(0xCC000000);
  static const Color accentColor = Color(0xFF9F9F9F);
  static const Color hintColor = Color(0xFF676666);
  static const Color pinColor = Color(0xFFD9D9D9);
  static const Color boxColor = Color(0xFFF2F2F2);
  static const Color dashboardColor = Color(0xFFF0EFEE);
  static const Color avatarColor = Color(0xFFFF914C);
  static const Color walletColor = Color(0xFFFFF0EFEE);
  static const Color buttonColor = Color(0xFFFF9F9F9F);
  static const Color whiteColor = Color(0xFFFFFFFF);
  //static const Color

  //TextStyles
  static const TextStyle headingTextSyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textColor,
  );
  static const TextStyle bodyTextStyle = TextStyle(
    fontSize: 16,
    color: textColor,
  );

  //Input Decorations
  static const InputDecoration inputDecoration = InputDecoration(
    border: OutlineInputBorder(),
    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
  );

  // Button Styles
  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: textColor, // Set the text color
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  );

  static ButtonStyle secondaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: textColor,
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  );
}
