import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/data/models/response/member_response.dart';

class MemberItem extends StatelessWidget {
  final MemberResponse member;
  final bool isCanMove;
  const MemberItem({required this.member,required this.isCanMove});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child : Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "${member.firstName} ${member.lastName}",
            textAlign: TextAlign.right,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.typographies.subBodyBold1.withColor(context.colors.primary),
          ),
          const SizedBox(
            width: 20,
          ),
          if(isCanMove) ...[
            SvgPicture.asset(Assets.icons.svg.icTrashCan.path, width: 25,),
          ]
          else ...[
            const SizedBox(
              width: 25,
            ),
          ]
        ],
      )
    );
  }
}
