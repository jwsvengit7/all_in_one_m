import 'dart:convert';

import 'package:all_in_one_m/config/enums.dart';
import 'package:all_in_one_m/shared/OTP.dart';
import 'package:all_in_one_m/user/services/authentication_service.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:all_in_one_m/components/app_bar.dart';
import 'package:all_in_one_m/components/custom_button.dart';
import 'package:all_in_one_m/components/text_field.dart';
import 'package:all_in_one_m/common/utils/image_manager.dart';
import 'package:all_in_one_m/common/utils/style_manager.dart';
import 'package:all_in_one_m/shared/login_screen.dart';
import 'package:flutter/material.dart';



class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final bool isPasswordVisible;
  final VoidCallback? onTogglePasswordVisibility;

  CustomTextField({
    required this.controller,
    required this.label,
    required this.isPassword,
    required this.isPasswordVisible,
    this.onTogglePasswordVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword && !isPasswordVisible,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: isPassword
            ? GestureDetector(
                onTap: onTogglePasswordVisibility,
                child: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
      ),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  final String role;
  const SignUpScreen({Key? key, required this.role}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isPasswordVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  Future<String?> signup_ = Future.value(null);

  void _handleSignup() {
    setState(() {
      signup_ = _performSignUp();
    });
  }

  Future<String?> _performSignUp() async {
    print(emailController.text +
        " /" +
        passwordController.text +
        phoneNumberController.text +
        Tier.TIER1.name +
        widget.role);
    try {
      final response = await AuthService().createAccount(
          email: emailController.text,
          password: passwordController.text,
          phoneNumber: phoneNumberController.text,
          accountType: Tier.TIER1.name,
          role:widget.role);

      if (response.statusCode == 201) {
        final responseData = json.decode(response.body);
        final statusCode = responseData["statusCode"];
        if (statusCode == 991) {
          final payLoad = responseData["payLoad"];
          final message = payLoad["message"];
          final user_email = payLoad["email"];
          if (user_email == emailController.text) {
            alert(message, statusCode, "success");
          }
        }
      } else {
        final responseData = json.decode(response.body);
        final statusCode = responseData["statusCode"];
        final payLoad = responseData["payLoad"];
        final message = payLoad["message"];
        alert(message, statusCode, "Warning");
        print('Registration failed: ${response.body}');
      }
    } catch (e) {
      alert("Try Again", 111, "Warning");
      print('Error during registration: $e');
    }
  }

  void alert(String message, int type, String messageType) {
    AwesomeDialog(
            context: context,
            desc: message,
            animType: AnimType.topSlide,
            dialogType: type == 991 ? DialogType.success : DialogType.warning,
            title: messageType,
            btnOkOnPress: () {
              print(type);
              if(type==991){
                  Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>  OTPScreen(email:emailController.text),
      ),
    );
              }
            })
        .show();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: StyleManager.backgroundColor,
          titleColor: StyleManager.backgroundColor,
          onBack: () {
            Navigator.pop(context);
          },
        ),
        body: FutureBuilder<String?>(
            future: signup_,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return MySignupWidget();
              }
            }),
      ),
    );
  }

  Widget MySignupWidget() {
    return SingleChildScrollView(
      child: Container(
        color: StyleManager.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 1),
              Center(
                child: Image.asset(
                  ImageManager.efuLogo,
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: emailController,
                label: "Enter Email",
                isPassword: false,
                isPasswordVisible: false,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: phoneNumberController,
                label: "Enter Phone Number",
                isPassword: false,
                isPasswordVisible: false,
              ),
            
              const SizedBox(height: 20),
              CustomTextField(
                controller: passwordController,
                label: "Password",
                isPassword: true,
                isPasswordVisible: isPasswordVisible,
                onTogglePasswordVisibility: togglePasswordVisibility,
              ),
              const SizedBox(height: 25),
              CustomButton(
                text: 'Sign Up',
                onPressed: _handleSignup,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
