import 'package:flutter/material.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
class ContentDetail extends StatelessWidget{
  final String text;
const ContentDetail({required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        text,
        style: TextStyle(color: context.colors.border,fontSize: 18),
        softWrap: true,
      ),
    );
  }

}