import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:uq_system_app/presentation/pages/create_site/create_site_bloc.dart';
import 'package:uq_system_app/presentation/pages/create_site/create_site_event.dart';
import 'package:uq_system_app/presentation/pages/create_site/create_site_selector.dart';
import 'package:uq_system_app/presentation/pages/create_site/widgets/details_tab.dart';
import 'package:uq_system_app/presentation/pages/create_site/widgets/images_tab.dart';

import '../../../assets.gen.dart';
import '../../../core/languages/translation_keys.g.dart';
import '../../widgets/dashboard_app_bar.dart';


@RoutePage()
class CreateSitePage extends StatefulWidget {
  @override
  State<CreateSitePage> createState() => _CreateSitePageState();
}

class _CreateSitePageState extends State<CreateSitePage>
    with SingleTickerProviderStateMixin {
  final CreateSiteBloc _bloc = getIt.get<CreateSiteBloc>();
  final int userId = getIt<AuthBloc>().state.account!.id;
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    scheduleMicrotask(() {
      _bloc.add(CreateSiteLoadInfo(userId: userId));
    });
  }

  @override
  void dispose() {
    _bloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        appBar: DashBoardAppBar(
          title: context.tr(LocaleKeys.SiteDetail_DetailedInformationOnSite),
          leftIcPath: Assets.icons.svg.icLeftBack.path,
          onLeftPressed: () {
            context.router.pop();
          },
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.symmetric(vertical: 5),
              alignment: Alignment.center,
              width: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: context.colors.tertiary, width: 2),
              ),
              child: Text(
                context.tr(LocaleKeys.SiteDetail_OrderingSite),
                style: context.typographies.subBodyBold1,
              ),
            ),
            _buildTapBars(),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: Container(
              color: Colors.white,
              child: Stack(
                children: [
                  CreateSiteStatusSelector(builder: (status) {
                    return TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: controller,
                        children: [DetailsTab(userId), ImagesTab()]);
                  }),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 3,
                                            color: context.colors.quaternary),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                child: Text(
                                  "保存",
                                  style: context.typographies.bodyBold
                                      .withColor(context.colors.quaternary),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  _bloc.add(const CreateSiteEvent.submit());
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: context.colors.secondary,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                child: Text(
                                  "登録",
                                  style: context.typographies.bodyBold
                                      .withColor(Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildTapBars() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      height: 35,
      child: TabBar(
        controller: controller,
        indicatorPadding: const EdgeInsets.all(5),
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
            color: const Color(0xFF4A4B4F),
            borderRadius: BorderRadius.circular(15)),
        dividerColor: Colors.transparent,
        labelStyle: context.typographies.subBodyBold1.withColor(Colors.white),
        unselectedLabelStyle: context.typographies.subBodyBold1
            .withColor(const Color(0xFF868686)),
        tabs: [
          Tab(
            text: context.tr(LocaleKeys.SiteDetail_SiteDetails),
          ),
          Tab(
            text: context.tr(LocaleKeys.SiteDetail_Image),
          )
        ],
      ),
    );
  }



}
