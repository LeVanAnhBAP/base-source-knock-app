import 'package:flutter/material.dart';

class LogButton extends StatelessWidget {
  final String buttonName;
  final Color color;
  final Function() onClick;
  const LogButton({
    super.key,
    required this.color,
    required this.buttonName,
    required this.onClick,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onClick,
        child: Text(
          buttonName,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
