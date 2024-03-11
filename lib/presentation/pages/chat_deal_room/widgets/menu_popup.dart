import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/presentation/widgets/divider_line.dart';

class MenuPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: SizedBox(
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    left: 0,
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                        child:
                            SvgPicture.asset(Assets.icons.svg.icClose.path))),
                Text(
                  "(株)職人インテリアさま",
                  style: context.typographies.bodyBold,
                )
              ],
            ),
          ),
        ),
        const DividerLine(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2, crossAxisCount: 3),
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(Assets.icons.svg.icOrder.path),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "発注する",
                    style: context.typographies.subBody1,
                  )
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(Assets.icons.svg.icOrderList.path),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "発注一覧",
                    style: context.typographies.subBody1,
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
