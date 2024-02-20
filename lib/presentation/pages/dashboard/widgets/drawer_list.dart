import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:uq_system_app/presentation/blocs/auth/auth_event.dart';
import 'package:uq_system_app/presentation/widgets/divider_line.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AssetGenImage(Assets.icons.png.icKnock.path)
                  .image(height: 40, width: 30),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      "Knockメンバー管理",
                      style: context.typographies.bodyBold,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildItem(context, "メンバー招待", () {})
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const DividerLine(),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AssetGenImage(Assets.icons.png.icCatalog.path)
                  .image(height: 40, width: 30),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      "電子帳票管理",
                      style: context.typographies.bodyBold,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildItem(context, "注文(請)書", () {}),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildItem(context, "請求書", () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const DividerLine(),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AssetGenImage(Assets.icons.png.icSetting.path)
                  .image(height: 40, width: 30),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      "設定",
                      style: context.typographies.bodyBold,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildItem(context, "契約情報", () {}),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildItem(context, "アカウント情報", () {}),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildItem(context, "お支払情報", () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const DividerLine(),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AssetGenImage(Assets.icons.png.icLightBulb.path)
                  .image(height: 40, width: 30),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      "利用方法",
                      style: context.typographies.bodyBold,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildItem(context, "マニュアル", () {}),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildItem(context, "問い合わせフォーム", () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const DividerLine(),
        InkWell(
          onTap: (){
            getIt<AuthBloc>().add(const AuthLoggedOut());
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AssetGenImage(Assets.icons.png.icLogOut.path)
                    .image(height: 40, width: 30),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        "ログアウト",
                        style: context.typographies.bodyBold.withColor(const Color(0xFFC00000)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildItem(BuildContext context, String desc, void Function() onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          desc,
          style: context.typographies.body,
        ),
        SvgPicture.asset(
          Assets.icons.svg.icRightBack.path,
          width: 8,
        )
      ],
    );
  }
}
