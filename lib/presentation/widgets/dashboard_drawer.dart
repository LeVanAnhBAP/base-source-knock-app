import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uq_system_app/core/extensions/theme.dart';

import '../../assets.gen.dart';

class DashboardDrawer extends StatelessWidget {
  final BuildContext context;

  const DashboardDrawer({required this.context});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.colors.background,
      child: ListView(
        children: [
          title(Assets.icons.svg.drawerKnockLogo.path, 'Knockメンバー管理'),
          button('メンバー招待', () {}),
          line(context.colors.border),
          title(Assets.icons.svg.drawerForm.path, '電子帳票管理'),
          button('注文(請)書', () {}),
          button('請求書', () {}),
          line(context.colors.border),
          title(Assets.icons.svg.drawerSetting.path, '設定'),
          button('契約情報', () {}),
          button('アカウント情報', () {}),
          button('お支払情報', () {}),
          line(context.colors.border),
          title(Assets.icons.svg.drawerHowToUse.path, '利用方法'),
          button('マニュアル', () {}),
          button('問い合わせフォーム', () {}),
          line(context.colors.border),
          InkWell(
              onTap: () {},
              child: Ink(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: title(Assets.icons.svg.drawerLogout.path, 'ログアウト'))),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Widget line(Color color) {
    return Container(
      height: 0.4,
      color: color,
    );
  }

  Widget title(String icon, String text) {
    return SizedBox(
      height: 56,
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: SvgPicture.asset(icon),
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }

  Widget button(String text, Function() onClick) {
    return InkWell(
      onTap: onClick,
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(width: 60),
                  Text(
                    text,
                    style:
                        TextStyle(color: context.colors.border, fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(Assets.icons.svg.drawerButton.path),
                  const SizedBox(width: 24),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
