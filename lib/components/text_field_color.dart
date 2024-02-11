import 'package:all_in_one_m/common/utils/style_manager.dart';
import 'package:flutter/material.dart';

class CustomTextFieldColor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final bool isPasswordVisible;

  const CustomTextFieldColor({
    Key? key,
    required this.controller,
    required this.label,
    required this.isPassword,
    required this.isPasswordVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: StyleManager.primaryColor,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: StyleManager.backgroundColor,
                      width: 3.0,
                    ),
                  ),
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
                              isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {},
                          )
                        : null,
                  ),
                ),
              ),
            ],
          ),
        ],
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

