import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/extensions/theme.dart';

class IconOptions {
  final double size;
  final BorderRadiusGeometry borderRadius;
  final Color? color;

  const IconOptions({
    this.size = 24,
    this.color,
    this.borderRadius = const BorderRadius.all(Radius.circular(24)),
  });
}

class CustomAppBar extends AppBar {
  final String appBarTitle;
  final TextAlign titleAlign;
  final EdgeInsetsGeometry? titleMargin;
  final String? leftIcPath;
  final String? leftIcDescription;
  final String? rightIcPath;
  final String? rightIcDescription;
  final Function()? onRightPress;
  final Function()? onLeftPress;
  final BuildContext context;

  CustomAppBar(
    this.context, {
    required this.appBarTitle,
    this.leftIcPath,
    this.leftIcDescription,
    this.rightIcPath,
    this.rightIcDescription,
    this.onLeftPress,
    this.titleMargin,
    this.onRightPress,
    this.titleAlign = TextAlign.center,
    super.title,
    super.toolbarHeight,
    super.elevation,
    super.backgroundColor = Colors.white,
    super.titleSpacing = 0,
  });

  @override
  Widget? get title => Container(
        margin: titleMargin ??
            const EdgeInsets.only(
              right: 34,
              top: 0,
              bottom: 0,
            ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              appBarTitle,
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
      );

  Widget _buildIcon(String icPath, String? icDescription) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 25,
            child: InkWell(
              onTap: onRightPress,
              child: SvgPicture.asset(
                icPath,
                fit: BoxFit.scaleDown,
                width: 25,
                height: 25,
              ),
            ),
          ),
          if (icDescription != null) ...[

            Text(
              icDescription,
              style: context.typographies.subBody3,
            )
          ]
        ],
      ),
    );
  }

  @override
  List<Widget>? get actions => [
        if (rightIcPath != null)
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: onRightPress,
              child: _buildIcon(rightIcPath!, rightIcDescription),
            ),
          ),
      ];

  @override
  Widget? get leading => leftIcPath != null
      ? InkWell(
          onTap: () => onLeftPress,
          child: _buildIcon(leftIcPath!, leftIcDescription),
        )
      : null;
}
