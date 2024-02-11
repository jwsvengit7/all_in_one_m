import 'dart:convert';

import 'package:all_in_one_m/common/utils/image_manager.dart';
import 'package:all_in_one_m/common/utils/style_manager.dart';
import 'package:all_in_one_m/components/text_field_color.dart';
import 'package:all_in_one_m/shared/OTP.dart';
import 'package:all_in_one_m/shared/login_screen.dart';
import 'package:all_in_one_m/user/services/authentication_service.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isPasswordVisible = false;
  TextEditingController emailController = TextEditingController();
    Future<String?> forget_password = Future.value(null);

  void _handlePassword() {
   print(emailController.text);
    setState(() {
      forget_password = forget_();
    });
  }
    Future<String?> forget_() async {
         print(emailController.text);

    try {
      final response = await AuthService().forget_password(email: emailController.text);
      print(response.statusCode);
     final responseData = json.decode(response.body);
    final message = responseData["message"];
    final statusCode = responseData["statusCode"];

    if (response.statusCode == 201 || response.statusCode == 200) {
      if (statusCode == 991) {
        print(statusCode);
        alert(message, statusCode, "Success");
      } else {
        alert(message, statusCode, "Warning");
      }
      
    } else {
      alert(message, statusCode, "Warning");
    }
      return "Success";
    } catch (e) {
      alert("Try Again Later ${e}", 0, "Warning");
      return null;
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
          print(991);
         
           if(type == 991 ){
               Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          
          }
        }).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   FutureBuilder<String?>(
            future: forget_password,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return myWidget();
              }
            }),
    );
      
  }
  Widget myWidget(){

      return SingleChildScrollView(
        child: Container(
          height: 900,
          color: StyleManager.primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    ImageManager.efu_Logo,
                    width: 150,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Forgot Password ?',
                      style: TextStyle(
                        color: StyleManager.textColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Fill in your registered email to reset your \npassword',
                      style: TextStyle(
                        color: StyleManager.textColor,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 50),
                    // CustomTextFieldColor(
                    //   controller: emailController,
                    //   label: "Email",
                    //   isPassword: false,
                    //   isPasswordVisible: false,
                    // ),
                      CustomTextField(
                controller: emailController,
                label: "Enter Email",
                isPassword: false,
                isPasswordVisible: false,
              ),
          
                    const SizedBox(height: 50),
                    // Add more widgets as needed
                  ],
                ),
                Center(
                  child: Container(
                    width: 350.0,
                    height: 70.0,
                    margin: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: StyleManager.backgroundColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextButton(
                      onPressed: _handlePassword,
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      'Login?',
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
          )
        
      ),
    );
  }
}
