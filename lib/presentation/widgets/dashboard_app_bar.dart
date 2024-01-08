import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/extensions/theme.dart';

class DashBoardAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  String? leftIcPath;
  String? leftIcDes;
  String? rightIcPath;
  String? rightIcDescription;
  DashBoardAppBar(
      {super.key,
      required this.title,
      this.leftIcPath,
      this.leftIcDes,
      this.rightIcPath,
      this.rightIcDescription})
      : preferredSize = const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 20,
          ),
          if (leftIcPath != null) ...[
            SvgPicture.asset(
              leftIcPath!,
              width: 20,
              height: 20,
            ),
          ],
          Expanded(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: context.typographies.title2.withWeight(FontWeight.w300),
                ),
                Container(
                  width: 70,
                  height: 3,
                  decoration: BoxDecoration(
                      color: context.colors.secondary,
                      borderRadius: BorderRadius.circular(5)),
                )
              ],
            ),
          )),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (rightIcPath != null) ...[
                SvgPicture.asset(
                  rightIcPath!,
                  width: 25,
                  height: 25,
                ),
              ],
              if (rightIcDescription != null) ...[
                const SizedBox(
                  height: 3,
                ),
                Text(
                  rightIcDescription!,
                  style: context.typographies.subBody3,
                )
              ]
            ],
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  @override
  final Size preferredSize;
}
