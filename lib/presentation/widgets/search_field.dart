import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:flutter/material.dart';

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
  final Function() clickSearch;

  const SearchField({
    super.key,
    required this.onSearchValue,
    this.placeholder,
    this.fontSize = 16,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.padding = const EdgeInsets.symmetric(vertical: 8),
    this.backgroundColor,
    this.placeholderColor,
    this.backgroundOpacity = 0.2,
    this.placeholderOpacity = 0.5,
    required this.clickSearch,
  });

  @override
  State<StatefulWidget> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: (widget.backgroundColor ?? context.colors.background)
              .withOpacity(widget.backgroundOpacity),
          borderRadius: widget.borderRadius),
      child: TextField(
        decoration: InputDecoration(
          hintText: widget.placeholder,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: IconButton(
              onPressed: () {
                widget.clickSearch();
                FocusScope.of(context).requestFocus(FocusNode());
              },
              icon: Icon(
                Icons.search_outlined,
                color: context.colors.border,
              ),
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide.none, borderRadius: widget.borderRadius),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none, borderRadius: widget.borderRadius),
          hintStyle: context.typographies.body.copyWith(
            color: (widget.placeholderColor ?? context.colors.background)
                .withOpacity(widget.placeholderOpacity),
            fontSize: widget.fontSize,
          ),
          contentPadding: widget.padding,
        ),
        autocorrect: false,
        style: context.typographies.body.copyWith(fontSize: widget.fontSize),
        onChanged: widget.onSearchValue,
      ),
    );
  }
}
