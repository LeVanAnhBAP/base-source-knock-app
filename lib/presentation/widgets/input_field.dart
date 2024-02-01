import 'package:flutter/material.dart';
import 'package:uq_system_app/core/extensions/theme.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    this.textFieldHintText = '',
    required this.controller,
    this.obscureText = false,
    this.onChangedValue,
    this.height=60,
    this.maxLines=1,
    this.maxLength
  });
  final Function(String value)? onChangedValue;
  final String textFieldHintText;
  final TextEditingController controller;
  final bool obscureText;
  final double height;
  final int? maxLines;
  final int? maxLength;

  void _moveCursorToEnd() {
    Future.delayed(Duration.zero, () {
      final text = controller.text;
      controller.value = controller.value.copyWith(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
      height: height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: const Color.fromRGBO(247, 248, 250, 1),
        border: Border.all(color: context.colors.background, width: 2),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 2,
            spreadRadius: 2,
          ),
        ],
      ),
      child: TextField(
        maxLength: maxLength,
        onTap: _moveCursorToEnd,
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.newline,
        maxLines: maxLines,
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          counterText: '',
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
          contentPadding: const EdgeInsets.only(left: 16,top: 32),
        ),
      ),
    );
  }
}
