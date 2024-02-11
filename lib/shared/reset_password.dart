import 'package:all_in_one_m/common/utils/image_manager.dart';
import 'package:all_in_one_m/common/utils/style_manager.dart';
import 'package:all_in_one_m/components/text_field_color.dart';
import 'package:all_in_one_m/shared/login_screen.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool isPasswordVisible = false;
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                    width: 120,
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 70),
                const Center(
                  child: Text(
                    'Reset Your Password',
                    style: TextStyle(
                      color: StyleManager.textColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 90),
                CustomTextFieldColor(
                  controller: emailController,
                  label: "New Password",
                  isPassword: true,
                  isPasswordVisible: true,
                ),
                const SizedBox(height: 20),
                CustomTextFieldColor(
                  controller: emailController,
                  label: "Confirm Password",
                  isPassword: true,
                  isPasswordVisible: true,
                ),
                const SizedBox(height: 80),
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      },
                      child: const Text(
                        'Reset',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
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
          ),
        ),
      ),
    );
  }
}



// //const TextField(
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                   ),
//                 ),