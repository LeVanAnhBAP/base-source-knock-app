import 'package:flutter/material.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
class TitleDetail extends StatelessWidget{
  final String text;
const TitleDetail({required this.text});
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text,
        style: context.typographies.title3,
      ),
    );
  }
}