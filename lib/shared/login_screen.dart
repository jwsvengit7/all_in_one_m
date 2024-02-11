import 'dart:convert';

import 'package:all_in_one_m/common/utils/image_manager.dart';
import 'package:all_in_one_m/common/utils/style_manager.dart';
import 'package:all_in_one_m/components/app_bar.dart';
import 'package:all_in_one_m/components/custom_button.dart';
import 'package:all_in_one_m/components/text_field.dart';
import 'package:all_in_one_m/shared/forgot_password.dart';
import 'package:all_in_one_m/shared/create_PIN.dart';
import 'package:all_in_one_m/user/model/response/login_response.dart';
import 'package:all_in_one_m/user/model/response/user.dart';
import 'package:all_in_one_m/user/screens/user_dashboard.dart';
import 'package:all_in_one_m/user/screens/user_profile.dart';
import 'package:all_in_one_m/user/services/authentication_service.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



//   Widget loginWidget() {
//     return Container(
//       color: StyleManager.backgroundColor,
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(25.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 2),
//               Center(
//                 child: Image.asset(
//                   ImageManager.efuLogo,
//                   width: 150,
//                   height: 150,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//               Center(
//                 child: Image.asset(
//                   ImageManager.efu_bus,
//                   width: 187,
//                   height: 72,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                 'Log in',
//                 style: TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               CustomTextField(
//                 controller: emailController,
//                 label: "Enter Email",
//                 isPassword: false,
//                 isPasswordVisible: false,
//               ),
//               const SizedBox(height: 20),
//               CustomTextField(
//                 controller: passwordController,
//                 label: "Enter Password",
//                 isPassword: true,
//                 isPasswordVisible: true,
//               ),
//               const SizedBox(height: 40),
//               CustomButton(
//                 text: 'Log in',
//                 onPressed: _login,
//               ),
//               Center(
//                 child: TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const ForgotPassword()),
//                     );
//                   },
//                   child: const Text(
//                     'Forgot password?',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 14.0,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }






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

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  Future<LoginResponse?> login_ = Future.value(null);

  void _handleSignup() {
    setState(() {
      login_ = _performLogin();
    });
  }

    Future storage() async {
    return await SharedPreferences.getInstance();
  }

  Future<LoginResponse?> _performLogin() async {

    try {
      final response = await AuthService().login(
          email: emailController.text, password: passwordController.text);

      final responseData = json.decode(response.body);
      final statusCode = responseData["statusCode"];
      final payLoad = responseData["payLoad"];
      final message = responseData["message"];
      if (response.statusCode == 200) {

        LoginResponse loginResponse = LoginResponse.fromJson(payLoad);

        if (statusCode == 991) {

          SharedPreferences preferences = await storage();
        

          preferences.setInt("id", loginResponse.id);
          preferences.setString("email", loginResponse.email);
          preferences.setString("accessToken", loginResponse.accessToken);
          preferences.setString("refreshToken", loginResponse.refreshToken);
          alert(loginResponse.message, statusCode, "success",
              loginResponse.profileStatus);
        } else {
          alert(loginResponse.message, statusCode, "Warning", null);
        }
        return loginResponse;
      } else {
        alert(payLoad["message"], statusCode, "Warning", null);
        return null;
      }
    } catch (e) {
      alert("Try Again ${e}", 111, "Warning", null);

      return null;
    }
  }


  void alert(String message, int type, String messageType, bool? status) {
    AwesomeDialog(
        context: context,
        desc: message,
        animType: AnimType.topSlide,
        dialogType: type == 991 ? DialogType.success : DialogType.warning,
        title: messageType,
        btnOkOnPress: () {
          print(type);
          if (type == 991 && status == true) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const UserDashboard(),
              ),
            );
          } else if (type == 991 && status == false) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const UserProfile(),
              ),
            );
          }
        }).show();
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
        body: FutureBuilder<LoginResponse?>(
            future: login_,
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
              const Text(
                'Log in',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
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
                controller: passwordController,
                label: "Enter Password",
                isPassword: true,
                isPasswordVisible: true,
                                onTogglePasswordVisibility: togglePasswordVisibility,

              ),
            
             
              const SizedBox(height: 25),
              CustomButton(
                text: 'Login',
                onPressed: _handleSignup,
              ),

               Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPassword()),
                    );
                  },
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




