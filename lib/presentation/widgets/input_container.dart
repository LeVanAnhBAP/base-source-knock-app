import 'package:flutter/material.dart';

class InputContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final AlignmentGeometry? alignment;

  const InputContainer(
      {required this.child,
      this.width,
      this.height,
      this.padding,
      this.backgroundColor,
      this.alignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      width: width,
      height: height,
      padding: padding ?? const EdgeInsets.only(top: 6),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.2,
              blurRadius: 1,
              offset: const Offset(0, 3),
            ),
          ],
          color: backgroundColor ?? const Color(0xffF7F8FA),
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(15)),
      child: child,
    );
  }
}
