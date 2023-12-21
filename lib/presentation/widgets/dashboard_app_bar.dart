

import 'package:flutter/material.dart';
import 'package:uq_system_app/core/extensions/theme.dart';


class DashBoardAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData leftIcon;
  final IconData rightIcon;
  const DashBoardAppBar({super.key, required this.title, required this.leftIcon, required this.rightIcon})
   : preferredSize = const Size.fromHeight(40);

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
          Icon(leftIcon, size: 30, color: context.colors.primary,),
          Expanded(child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style:  const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600
                ),),
                Container(
                  width: 70,
                  height: 3,
                  decoration: BoxDecoration(
                    color: context.colors.secondary,
                    borderRadius: BorderRadius.circular(5)
                  ),
                )
              ],
            ),
          )),
          Icon(rightIcon, size: 30, color: context.colors.primary,),
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