import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    required this.controller,
    required this.hintText,
    required this.text,
    this.width = 1.5,
    this.icon,
    this.obscureText = false,
    required this.validator,
    required this.textInputAction,
  });
  final TextEditingController controller;
  final String hintText, text;
  final double width;
  final IconButton? icon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Color(0xFF000000),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          obscureText: obscureText,
          validator: validator,

          // autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,

          decoration: InputDecoration(
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.red,
                width: width,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: const Color(0xFFC7C7C8),
                width: width,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.red,
                width: width,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: const Color(0xFFC7C7C8),
                width: width,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: const Color(0xFFC7C7C8),
                width: width,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: const Color(0xFFC7C7C8),
                width: width,
              ),
            ),
            contentPadding: const EdgeInsets.all(10),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xFFC7C7C8),
              fontWeight: FontWeight.w400,
            ),
            suffixIcon: icon,
          ),
          // onChanged: loginScreenController.validateEmail,
          textInputAction: textInputAction,
        ),
      ],
    );
  }
}
