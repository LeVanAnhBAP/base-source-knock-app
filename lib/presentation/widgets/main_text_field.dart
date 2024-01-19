import 'package:flutter/material.dart';
import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/presentation/widgets/input_container.dart';

class MainTextField extends StatelessWidget {
  final String? hintText;
  final double? height;
  final int? maxLength;
  final int? maxLines;
  final TextEditingController? controller;

  const MainTextField(
      {super.key,
      this.hintText,
      this.height,
      this.maxLines,
      this.maxLength,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return InputContainer(
        height: height,
        child: TextField(
          controller: controller,
          maxLength: maxLength,
          style:
              context.typographies.bodyBold.withColor(context.colors.primary),
          decoration: InputDecoration(
              counter: Container(),
              fillColor: const Color(0xffF7F8FA),
              enabledBorder: InputBorder.none,
              hintStyle: const TextStyle(color: Color(0xffA2A2A2)),
              hintText: hintText,
              border: InputBorder.none),
          maxLines: maxLines,
        ));
  }
}
