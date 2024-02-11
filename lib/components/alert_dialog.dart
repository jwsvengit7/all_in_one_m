import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onOkPressed;

  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.onOkPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: onOkPressed,
          child: const Text('OK'),
        ),
      ],
    );
  }
}

//to use
// CustomAlertDialog(
  //title: 'Alert Title',
  //content: 'This is the alert message.',
  //onOkPressed: () {
    // Handle OK button press
    //Navigator.of(context).pop(); // Close the dialog or perform any other action
 // },
//)

