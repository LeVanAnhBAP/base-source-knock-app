import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/core/languages/translation_keys.g.dart';
import 'package:uq_system_app/presentation/navigation/navigation.dart';
import 'package:uq_system_app/presentation/pages/site_details/site_details_bloc.dart';
import 'package:uq_system_app/presentation/pages/site_details/site_details_event.dart';
import 'package:uq_system_app/presentation/widgets/alert_dialog.dart';
import 'package:uq_system_app/presentation/widgets/divider_line.dart';

class MenuPopup extends StatelessWidget {
  final SiteDetailsBloc bloc;

  const MenuPopup(this.bloc);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            bloc.state.siteDetails?.name ?? "",
            style: context.typographies.bodyBold,
          ),
        ),
        const DividerLine(),
        const SizedBox(
          height: 10,
        ),
        GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.5, crossAxisSpacing: 0, crossAxisCount: 3),
          children: [
            _buildMenuItem(
                context: context,
                icPath: Assets.icons.svg.icLocation.path,
                description: "現場から探す",
                onTap: () {
                  Navigator.pop(context);
                  context.router
                      .push(WorkerMapRoute(siteId: bloc.state.siteDetails!.id));
                }),
            _buildMenuItem(
                context: context,
                icPath: Assets.icons.svg.icDashboardChat.path,
                description: "チャットへ移動",
                onTap: () {
                  Navigator.pop(context);
                }),
            _buildMenuItem(
                context: context,
                icPath: Assets.icons.svg.icTrashCan2.path,
                description: "削除",
                onTap: () {
                  showAlertDialog(context: context, messages: [
                    context
                        .tr(LocaleKeys.SiteDetail_DoYouReallyWantToDeleteThis)
                  ],
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        context.tr(LocaleKeys.No),
                        style: context.typographies.bodyBold
                            .withColor(context.colors.tertiary),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        bloc.add(const SiteDetailsEvent.remove());
                      },
                      child: Text(
                        context.tr(LocaleKeys.Yes),
                        style: context.typographies.bodyBold
                            .withColor(context.colors.tertiary),
                      ),
                    )
                  ]);
                },
                textColor: Colors.red),
            _buildMenuItem(
                context: context,
                icPath: Assets.icons.svg.icCopy.path,
                description: "現場を複製",
                onTap: () {
                  Navigator.pop(context);
                  context.router.push(CreateSiteRoute(
                      siteId: bloc.state.siteDetails?.id,
                      isCopy: true,
                      isDraft: true));
                }),
          ],
        )
      ],
    );
  }

  Widget _buildMenuItem({
    required BuildContext context,
    required String icPath,
    required String description,
    required void Function() onTap,
    Color? textColor,
  }) {
    return InkWell(
      onTap: onTap,
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icPath,
              width: 20,
              height: 20,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(description,
                style: context.typographies.subBody2.withColor(textColor))
          ],
        ),
      ),
    );
  }
}
