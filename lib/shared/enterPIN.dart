import 'package:all_in_one_m/common/utils/style_manager.dart';
import 'package:all_in_one_m/components/app_bar.dart';
import 'package:all_in_one_m/components/custom_button.dart';
import 'package:all_in_one_m/user/screens/user_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EnterTransactionPIN extends StatefulWidget {
  const EnterTransactionPIN({Key? key}) : super(key: key);

  @override
  _EnterTransactionPINScreenState createState() => _EnterTransactionPINScreenState();
}

class _EnterTransactionPINScreenState extends State<EnterTransactionPIN> {
  String enteredPin = "";
  // bool isPinVisible = true;

  // Widget used for each digit
  Widget numButton(int number) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextButton(
        onPressed: () {
          setState(() {
            if (enteredPin.length < 4) {
              enteredPin += number.toString();
            }
          });
        },
        child: Text(
          number.toString(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleManager.backgroundColor,
      appBar: CustomAppBar(
        backgroundColor: StyleManager.backgroundColor,
        titleColor: StyleManager.backgroundColor,
        onBack: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          physics: const BouncingScrollPhysics(),
          children: [
            const Center(
              child: Text(
                'Enter Transaction PIN',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 50),

          

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Container(
                  margin: const EdgeInsets.all(6.0),
                  height: 20,
                  width: 20,
                  child: TextField(
                    enabled: true,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700),
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: StyleManager.pinColor,
                          
                          width: 2.0,
                        ),
                      ),
                      filled: true,
                      fillColor: index < enteredPin.length
                          ? StyleManager.pinColor
                          : Colors.transparent,
                    ),
                    controller: TextEditingController(
                        text: index < enteredPin.length ? '*' : ''),
                  ),
                );
              }),
            ),

            // width: isPinVisible ? 50 : 16,
            // height: isPinVisible ? 50 : 16,
// child: isPinVisible && index < enteredPin.length
            //     ? Center(
            //         child: Text(
            //           enteredPin[index],
            //           style: const TextStyle(
            //               fontSize: 14,
            //               color: CupertinoColors.systemYellow,
            //               fontWeight: FontWeight.w700),
            //         ),
            //       )
            //     : null,
            // IconButton(
            //   onPressed: () {
            //     setState(() {
            //       // isPinVisible = !isPinVisible;
            //     });
            //   },
            //   icon: Icon(
            //     // isPinVisible ? Icons.visibility : Icons.visibility_off,
            //     // color: StyleManager.backgroundColor,
            //   ),
            // ),

            CustomButton(
              text: 'Proceed',
              onPressed: () {
                if (enteredPin.length == 4) {
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
    );
  }
}
