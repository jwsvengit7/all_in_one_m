import 'package:all_in_one_m/common/utils/style_manager.dart';
import 'package:all_in_one_m/components/custom_app_title.dart';
import 'package:all_in_one_m/components/custom_button.dart';
import 'package:flutter/material.dart';

class ChangeTransactionPinScreen extends StatefulWidget {
  @override
  _ChangeTransactionPinScreenState createState() =>
      _ChangeTransactionPinScreenState();
}

class _ChangeTransactionPinScreenState
    extends State<ChangeTransactionPinScreen> {
  TextEditingController _newPinController = TextEditingController();
  TextEditingController _repeatPinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: CustomAppBarText(
                backgroundColor: StyleManager.backgroundColor,
                titleColor: StyleManager.textColor,
                onBack: () {
                  Navigator.pop(context);
                },
                title: 'Change Transaction PIN'),
            body: SingleChildScrollView(
              child: Container(
                color: StyleManager.backgroundColor,
                child: Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 28.0, left: 18.0, top: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Enter New Transaction PIN',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            4,
                            (index) => SizedBox(
                              width: (MediaQuery.of(context).size.width -
                                      8 * 10 -
                                      8 * 3) /
                                  4,
                              child: TextField(
                                controller: _newPinController,
                                keyboardType: TextInputType.number,
                                obscureText: true,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Text(
                          'Repeat Transaction PIN',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            4,
                            (index) => SizedBox(
                              width: (MediaQuery.of(context).size.width -
                                      8 * 10 -
                                      8 * 3) /
                                  4,
                              child: TextField(
                                controller: _repeatPinController,
                                keyboardType: TextInputType.number,
                                obscureText: true,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 24.0),
                        CustomButton(
                          text: 'Submit',
                          onPressed: () {
                            // Handle submit button press
                            String newPin = _newPinController.text;
                            String repeatPin = _repeatPinController.text;

                            // Add your validation logic here

                            if (newPin == repeatPin) {
                              print('PIN changed successfully!');
                            } else {
                              // The new PIN and repeated PIN do not match, show an error
                              print('PINs do not match. Please try again.');
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }

  @override
  void dispose() {
    _newPinController.dispose();
    _repeatPinController.dispose();
    super.dispose();
  }
}
