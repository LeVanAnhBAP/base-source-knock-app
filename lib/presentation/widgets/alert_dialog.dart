import 'package:flutter/material.dart';
import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/extensions/theme.dart';

Future showAlertDialog({
  required BuildContext context,
  String? title,
  required List<String> messages,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        actionsPadding: EdgeInsets.zero,
        title: title != null
            ? Text(
                title,
                style: context.typographies.bodyBold,
              )
            : Container(),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: ListView.builder(
            itemCount: messages.length,
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => Text(messages[index], style: context.typographies.subBody1,),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'OK',
              style: context.typographies.bodyBold.withColor(context.colors.tertiary),
            ),
          ),
        ],
      );
    },
  );
}
