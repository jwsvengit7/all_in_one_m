import 'package:all_in_one_m/common/utils/style_manager.dart';
import 'package:all_in_one_m/components/app_bar.dart';
import 'package:all_in_one_m/components/custom_button.dart';
import 'package:all_in_one_m/user/screens/user_profile.dart';
import 'package:flutter/material.dart';

class TransactionINScreen extends StatefulWidget {
  const TransactionINScreen({Key? key}) : super(key: key);

  @override
  _TransactionINScreenState createState() => _TransactionINScreenState();
}

class _TransactionINScreenState extends State<TransactionINScreen> {
  String pin = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: StyleManager.backgroundColor,
        titleColor: StyleManager.backgroundColor,
        onBack: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          color: StyleManager.backgroundColor,
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Create Transaction PIN',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 70),
              // PinCodeTextField(
              //   appContext: context,
              //   length: 4,
              //   obscureText: true,
              //   onChanged: (value) {
              //     setState(() {
              //       pin = value;
              //     });
              //   },
              //   pinTheme: PinTheme(
              //     shape: PinCodeFieldShape.circle,
              //     fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 20),
              //     fieldHeight: 25,
              //     fieldWidth: 40,
              //     activeColor: StyleManager.pinColor,
              //     inactiveColor: StyleManager.pinColor,
              //     activeFillColor: StyleManager.pinColor,
              //     selectedColor: StyleManager.pinColor,
              //   ),
              //   keyboardType: TextInputType.number,
              //   animationType: AnimationType.fade,
              //   animationDuration: const Duration(milliseconds: 300),
              // ),
              
              const SizedBox(height: 20),
              CustomButton(
                text: 'Proceed',
                onPressed: () {
                  if (pin.length == 4) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserProfile(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
