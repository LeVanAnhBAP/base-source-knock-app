import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/extensions/theme.dart';

class ChatItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildConfirmedOrder(context);
  }

  Widget _buildTextMessage(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      color: const Color(0xFFCCFE98),
      child: Text(
        "",
        style: context.typographies.bodyBold,
      ),
    );
  }

  Widget _buildConfirmedOrder(BuildContext context) {
    return Column(
      children: [
        Text("ーーーーーーー「発注が確定」しました。ーーーーーーー", style: context.typographies.subBody3,),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(Assets.icons.svg.icDashboardOnsite.path),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "現場情報ルーム",
                    style: context.typographies.subBody3,
                  ),
                  const Expanded(child: SizedBox()),
                  Column(
                    children: [
                      SvgPicture.asset(
                        Assets.icons.svg.icConfirmedOrderGreen.path,
                      ),
                      Text(
                        "発注確定",
                        style: context.typographies.subBody3
                            .withColor(context.colors.quaternary),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                    color: const Color(0xFFF7F8FA),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "【急募！】稲毛市住宅リフォーム現場塗...",
                      style: context.typographies.subBody3,
                          overflow: TextOverflow.ellipsis,
                    )),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: context.colors.secondary, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
