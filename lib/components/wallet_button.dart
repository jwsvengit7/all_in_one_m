import 'package:all_in_one_m/common/utils/style_manager.dart';
import 'package:flutter/material.dart';

class WalletButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final TextStyle? textStyle; // Add this line

  const WalletButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.textStyle, // Add this line
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: 320,
        height: 60,
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
          child: Text(
            buttonText,
            style: textStyle ?? TextStyle( 
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: StyleManager.buttonColor,
            ),
          ),
        ),
      ),
    );
  }
}
