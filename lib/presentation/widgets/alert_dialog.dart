import 'package:flutter/material.dart';
import 'package:uq_system_app/core/extensions/theme.dart';

Future showAlertDialog({
  required BuildContext context,
  required String message,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        contentPadding: const  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        actionsPadding: EdgeInsets.zero,
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK', style: TextStyle(
              color: context.colors.tertiary
            ),),
          ),
        ],
      );
    },
  );
}
