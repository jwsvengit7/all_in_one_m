import 'package:all_in_one_m/common/utils/style_manager.dart';
import 'package:all_in_one_m/components/app_bar.dart';
import 'package:all_in_one_m/components/custom_button.dart';
import 'package:all_in_one_m/shared/login_screen.dart';
// import 'package:all_in_one_m/user/screens/user_profile.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionPINScreen extends StatefulWidget {
  const TransactionPINScreen({Key? key}) : super(key: key);

  @override
  _TransactionPINScreenState createState() => _TransactionPINScreenState();
}

class _TransactionPINScreenState extends State<TransactionPINScreen> {
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
                'Create Transaction PIN',
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
                return InkWell(
                  onTap: () {
                    FocusScope.of(context).requestFocus(focusNodes[index]);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    height: 21,
                    width: 21,
                    child: TextField(
                      focusNode: focusNodes[index],
                      onChanged: (value) {
                        if (value.isNotEmpty &&
                            index < controllers.length - 1) {
                          FocusScope.of(context)
                              .requestFocus(focusNodes[index + 1]);
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
            CustomButton(
              text: 'Proceed',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
