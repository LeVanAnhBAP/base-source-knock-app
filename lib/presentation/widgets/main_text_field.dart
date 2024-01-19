import 'package:flutter/material.dart';
import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/presentation/widgets/input_container.dart';

class MainTextField extends StatefulWidget {
  final String? hintText;
  final double? height;
  final int? maxLength;
  final int? maxLines;
  final bool isCounter;
  final TextEditingController? controller;

  const MainTextField(
      {super.key,
      this.hintText,
      this.height,
      this.maxLines,
      this.maxLength,
      this.controller,
      this.isCounter = false});

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  int counterText = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        InputContainer(
            height: widget.height,
            alignment: Alignment.topLeft,
            child: TextField(
              controller: widget.controller,
              maxLength: widget.maxLength,
              onChanged: (value) {
                setState(() {
                  counterText = value.length;
                });
              },
              style: context.typographies.bodyBold
                  .withColor(context.colors.primary),
              decoration: InputDecoration(
                  counter: Container(),
                  fillColor: const Color(0xffF7F8FA),
                  enabledBorder: InputBorder.none,
                  hintStyle: const TextStyle(color: Color(0xffA2A2A2)),
                  hintText: widget.hintText,
                  border: InputBorder.none),
              maxLines: widget.maxLines,
            )),
        if (widget.isCounter) ...[
          const SizedBox(
            height: 3,
          ),
          Text(
            "$counterText/${widget.maxLength}",
            style:
                context.typographies.subBody1.withColor(context.colors.primary),
          )
        ]
      ],
    );
  }
}
