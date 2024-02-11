import 'dart:convert';

import 'package:all_in_one_m/common/utils/image_manager.dart';
import 'package:all_in_one_m/common/utils/style_manager.dart';
import 'package:all_in_one_m/shared/login_screen.dart';
import 'package:all_in_one_m/user/services/authentication_service.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OTPScreen extends StatefulWidget {
  final String email;
  const OTPScreen({Key? key, required this.email}) : super(key: key);

  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTPScreen> {
  List<TextEditingController> controllers =
      List.generate(4, (index) => TextEditingController());
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    focusNodes = List.generate(4, (index) => FocusNode());
  }

  @override
  void dispose() {
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  Future<String?> otp_ = Future.value(null);

  void verifyOtp() {
    setState(() {
      otp_ = sendPostRequestOTP();
    });
  }

  Future<String?> sendPostRequestOTP() async {
    String otp = controllers.map((controller) => controller.text).join();

    try {
      final response = await AuthService().verifyOTP(email: widget.email, otp: otp);

           callApi(response);
           return "Success";
    } catch (e) {
      alert("Error Occur ${e}", 111, "Warning");
         return null;
     
    }
  }

  void _resendOTP() {
    setState(() {
      otp_ = resendOTP();
    });
  }

  Future<String?> resendOTP() async {
    try {
      final response = await AuthService().resendOtp(email: widget.email);
      callApi(response);
      return "Success";
    } catch (e) {
      alert("Try Again Later ${e}", 0, "Warning");
      return null;
    }
  }

  void callApi(http.Response response) async {
    final responseData = json.decode(response.body);
    final message = responseData["message"];
    final statusCode = responseData["statusCode"];

    if (response.statusCode == 201 || response.statusCode == 200) {
      if (statusCode == 991) {
        alert(message, statusCode, "Success");
      } else {
        alert(message, statusCode, "Warning");
      }
      
    } else {
      alert(message, statusCode, "Warning");
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
         
           if(type == 991 && message=="Verification successful"){
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
                    width: 150,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Enter Your Passcode',
                      style: TextStyle(
                        color: StyleManager.textColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'An email has been sent to \n${widget.email}, \nVerify it to reset your password.',
                      style: const TextStyle(
                        color: StyleManager.textColor,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (index) {
                        return InkWell(
                          onTap: () {
                            FocusScope.of(context)
                                .requestFocus(focusNodes[index]);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(8.0),
                            height: 75,
                            width: 55,
                            child: TextField(
                              focusNode: focusNodes[index],
                              onChanged: (value) {
                                if (value.isNotEmpty &&
                                    index < controllers.length - 1) {
                                  FocusScope.of(context)
                                      .requestFocus(focusNodes[index + 1]);
                                } else if (value.isNotEmpty) {
                                  verifyOtp();
                                }
                              },
                              enabled: true,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                              keyboardType: TextInputType.number,
                              obscureText: true,
                              maxLength: 1,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                counterText: '',
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: StyleManager.pinColor,
                                    width: 2.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: StyleManager.pinColor,
                                    width: 2.0,
                                  ),
                                ),
                                filled: true,
                                fillColor: StyleManager.pinColor,
                              ),
                              controller: controllers[index],
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 2),
                    TextButton(
                      onPressed: _resendOTP,
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.only(left: 114.0),
                        ),
                      ),
                      child: Transform.translate(
                        offset: const Offset(
                            0.0, -10.0), // Adjust the values to move the text
                        child: const Text(
                          'Resend OTP?',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
