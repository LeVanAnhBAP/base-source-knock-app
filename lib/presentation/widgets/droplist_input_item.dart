

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/extensions/theme.dart';

import '../../assets.gen.dart';
import '../../core/languages/translation_keys.g.dart';
import 'input_container.dart';

class DropListInputItem extends StatefulWidget {
  final String title;
  final String content;
  const DropListInputItem({super.key, required this.title, required this.content});

  @override
  State<DropListInputItem> createState() => _DropListInputItemState();
}

class _DropListInputItemState extends State<DropListInputItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          widget.title,
          style: context.typographies.subBodyBold1,
        ),
        const SizedBox(
          height: 5,
        ),
        InputContainer(
            padding:
            const EdgeInsets.symmetric(vertical: 22, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.content,
                    style: context.typographies.subBody1
                        .withColor(context.colors.primary),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                SvgPicture.asset(Assets.icons.svg.icArrowDown.path, width: 15, )
              ],
            )),
      ],
    );
  }
}