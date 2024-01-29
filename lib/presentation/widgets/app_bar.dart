import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uq_system_app/core/extensions/theme.dart';

import '../../assets.gen.dart';

class AppBars extends StatelessWidget implements PreferredSizeWidget {
  final Function() openDrawer;
  final String title;
  final String rightButtonIcon;
  final bool isVisibleRightButton;
  final bool isVisibleDrawer;
  const AppBars({
    required this.title,
    required this.openDrawer,
    required this.rightButtonIcon,
    this.isVisibleRightButton = true,
    this.isVisibleDrawer = true
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 0,
      backgroundColor: context.colors.background,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 44,
            width: 44,
            child: Visibility(
              visible: isVisibleDrawer,
              child: IconButton(
                  icon: SvgPicture.asset(
                    Assets.icons.svg.icMenu.path,
                    height: 20,
                  ),
                  onPressed: openDrawer),
            ),
          ),
          Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontFamily: 'hiraginoW3',
                ),
              ),
              const SizedBox(height: 4),
              Container(
                decoration: BoxDecoration(
                    color: context.colors.warning,
                    borderRadius: const BorderRadius.all(Radius.circular(2))),
                height: 3,
                width: 100,
              )
            ],
          ),
          SizedBox(
            height: 44,
            width: 44,
            child: Visibility(
              visible: isVisibleRightButton,
              child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    rightButtonIcon,
                    height: 28,
                  )),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
