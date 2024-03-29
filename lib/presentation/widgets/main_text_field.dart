import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/presentation/widgets/input_container.dart';

class MainTextField extends StatefulWidget {
  final String? hintText;
  final double? height;
  final double? width;
  final int? maxLength;
  final int? maxLines;
  final bool isCounter;
  final bool? enable;
  final EdgeInsets? scrollPadding;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function()? onTap;
  final void Function(String value)? onChanged;

  const MainTextField(
      {super.key,
      this.hintText,
      this.scrollPadding,
      this.width,
      this.height,
      this.maxLines,
      this.maxLength,
      this.controller,
      this.isCounter = false,
      this.enable,
      this.textInputType,
      this.inputFormatters,
      this.onTapOutside,
      this.onTap,
      this.onChanged});

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
            child: TextField(
              scrollPadding: widget.scrollPadding ?? const EdgeInsets.all(20.0),
              keyboardType: widget.textInputType,
              inputFormatters: widget.inputFormatters,
              enabled: widget.enable,
              controller: widget.controller,
              maxLength: widget.maxLength,
              onChanged: (value) {
                if (widget.isCounter) {
                  setState(() {
                    counterText = value.length;
                  });
                }
                widget.onChanged?.call(value);
              },
              onTap: widget.onTap,
              onTapOutside: widget.onTapOutside,
              cursorColor: context.colors.tertiary,
              style: context.typographies.bodyBold
                  .withColor(context.colors.primary),
              decoration: InputDecoration(
                  errorMaxLines: 0,
                  isCollapsed: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  counter: const SizedBox.shrink(),
                  // error: const SizedBox.shrink(),
                  fillColor: const Color(0xffF7F8FA),
                  hintStyle: context.typographies.body
                      .withColor(context.colors.primary),
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
