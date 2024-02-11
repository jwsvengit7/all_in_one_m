import 'package:all_in_one_m/common/utils/style_manager.dart';
import 'package:flutter/material.dart';

class CustomTextBox extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const CustomTextBox({
    Key? key,
    required this.controller,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 60.0,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: StyleManager.boxColor,
          borderRadius: BorderRadius.circular(25.0),
          border: Border.all(color: StyleManager.boxColor),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: const TextStyle(
                color: StyleManager.hintColor,
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                controller: controller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
