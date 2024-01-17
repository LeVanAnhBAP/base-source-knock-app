import 'package:flutter/material.dart';
class TitleDetail extends StatelessWidget{
  final String text;
const TitleDetail({required this.text});
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}