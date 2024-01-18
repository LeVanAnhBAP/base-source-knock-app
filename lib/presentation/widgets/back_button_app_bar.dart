import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uq_system_app/core/extensions/theme.dart';

import '../../assets.gen.dart';

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const BackAppBar({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.background,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset(Assets.icons.svg.icBackAppBar.path),
      ),
      title: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: context.colors.warning,
                borderRadius: const BorderRadius.all(Radius.circular(2))),
            height: 3,
            width: 100,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
