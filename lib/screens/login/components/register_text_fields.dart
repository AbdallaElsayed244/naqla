import 'package:flutter/material.dart';

class RegisterTextFields extends StatelessWidget {
  RegisterTextFields({
    super.key,
    this.controller,
    this.onChanged,
    this.validator,
    required this.keyboardType,
    this.label,
    this.hintText,
    required this.obscureText,
  });
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final Widget? label;
  final String? hintText;
  final bool obscureText;
 

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      keyboardType:keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
          label: label,
          hintText: hintText,
          hintStyle: const TextStyle(color: Color.fromARGB(247, 90, 94, 98)),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(247, 158, 179, 200),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(215, 63, 101, 150),
            ),
            borderRadius: BorderRadius.circular(15),
          )),
    );
  }
}
