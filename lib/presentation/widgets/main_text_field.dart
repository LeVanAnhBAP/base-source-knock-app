import 'package:flutter/material.dart';
import 'package:uq_system_app/core/extensions/theme.dart';


class MainTextField extends StatelessWidget {
  final String? hintText;
  const MainTextField({super.key, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.2,
              blurRadius: 1,
              offset: const Offset(0, 3),
            ),
          ],
          color: const Color(0xffF7F8FA),
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(15)),
      child: TextField(
        style: context.appTheme.styles.textStyle,
        decoration: InputDecoration(
            fillColor: const Color(0xffF7F8FA),
            enabledBorder: InputBorder.none,
            hintStyle: const TextStyle(color: Color(0xffA2A2A2)),
            hintText: hintText ?? "",
            border: InputBorder.none),
      ),
    );
  }
}
