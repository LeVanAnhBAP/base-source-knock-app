

import 'package:flutter/material.dart';
import 'package:uq_system_app/core/extensions/theme.dart';

class InfoItem extends StatelessWidget {
  final String title;
  final String content;
  const InfoItem({super.key,required this.title,required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: context.typographies.subBodyBold1,
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            content,
            style: context.typographies.subBody1,
          ),
        ),
      ],
    );
  }
}