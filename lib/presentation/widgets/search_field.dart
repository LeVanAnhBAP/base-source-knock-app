import 'package:flutter_svg/svg.dart';
import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:flutter/material.dart';

import '../../assets.gen.dart';

class SearchField extends StatefulWidget {
  final String? placeholder;
  final double fontSize;
  final double backgroundOpacity;
  final double placeholderOpacity;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;
  final Color? placeholderColor;
  final BorderRadius borderRadius;
  final Function(String value) onSearchValue;

  const SearchField({
    super.key,
    required this.onSearchValue,
    this.placeholder,
    this.fontSize = 16,
    this.borderRadius = const BorderRadius.all(Radius.circular(25)),
    this.padding = const EdgeInsets.symmetric(vertical: 3, horizontal: 25),
    this.backgroundColor,
    this.placeholderColor = Colors.transparent,
    this.backgroundOpacity = 1,
    this.placeholderOpacity = 0.5,
  });

  @override
  State<StatefulWidget> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      decoration: BoxDecoration(
          color: widget.backgroundColor ?? const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.icons.svg.icSearch.path,
            width: 15,
            height: 15,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              style: context.typographies.body.withColor(context.colors.primary
                  ),
              onChanged: widget.onSearchValue,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                fillColor: widget.backgroundColor ?? const Color(0xFFF5F5F5),
                hintText: widget.placeholder,
                hintStyle:
                    context.typographies.body.withColor(context.colors.primary.withOpacity(widget.placeholderOpacity)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
