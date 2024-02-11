import 'package:flutter/material.dart';

class CustomTextFieldLogin extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final bool isPasswordVisible;

  const CustomTextFieldLogin(
      {Key? key,
      required this.controller,
      required this.label,
      required this.isPassword,
      required this.isPasswordVisible,
    })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: const Color.fromARGB(255, 203, 201, 201)),
      ),
      child: TextFormField(
        obscureText: isPassword && !isPasswordVisible,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          labelText: label,
          border: InputBorder.none,
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                 
                  },
                )
              : null,
        ),
      ),
    );
  }
}

//usage
//CustomTextField(
//controller: myTextController,
//label: 'Username',
//hintText: 'Enter your username',
//prefixIcon: Icons.person,
//)

