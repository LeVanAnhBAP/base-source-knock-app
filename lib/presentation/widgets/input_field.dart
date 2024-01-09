import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.textFieldHintText,
    required this.controller,
    this.obscureText = false,
  });
  final String textFieldHintText;
  final TextEditingController controller;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: const Color.fromRGBO(247, 248, 250, 1),
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 1,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Center(
        child: TextField(
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromRGBO(247, 248, 250, 1),
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            enabledBorder:
                const OutlineInputBorder(borderSide: BorderSide.none),
            hintStyle: const TextStyle(
              fontSize: 16,
              color: Colors.cyan,
            ),
            hintText: textFieldHintText,
            contentPadding: const EdgeInsets.only(left: 16),
          ),
        ),
      ),
    );
  }
}
