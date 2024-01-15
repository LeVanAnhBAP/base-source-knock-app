import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/core/languages/translation_keys.g.dart';
import 'package:uq_system_app/presentation/navigation/navigation.dart';

import 'widgets/icon_item.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  final String accessToken;
  const DashboardPage({super.key,required this.accessToken});

  @override
  State<StatefulWidget> createState() {
    return _DashboardPageState();
  }
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes:  [
        DashboardHomeRoute(accessToken: widget.accessToken),
        DashboardSiteRoute(accessToken: widget.accessToken),
        const DashboardChatRoute(),
        const DashboardSearchRoute(),
        const DashboardProfileRoute()
      ],
      bottomNavigationBuilder: (context, tabsRouter) => Container(
        height: 80,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, -2),
              blurRadius: 6,
              spreadRadius: 3,
            ),
          ]
        ),
        child: BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
              activeIcon: IconItem(
                  path: Assets.icons.svg.icDashboardHome.path, isSelected: true),
              icon: IconItem(path: Assets.icons.svg.icDashboardHome.path),
              label: context.tr(LocaleKeys.Dashboard_Home),
            ),
            BottomNavigationBarItem(
              activeIcon: IconItem(
                  path: Assets.icons.svg.icDashboardSite.path, isSelected: true),
              icon: IconItem(path: Assets.icons.svg.icDashboardSite.path),
              label: 'Site',
            ),
            BottomNavigationBarItem(
              activeIcon: IconItem(
                  path: Assets.icons.svg.icDashboardChat.path, isSelected: true),
              icon: IconItem(path: Assets.icons.svg.icDashboardChat.path),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              activeIcon: IconItem(
                  path: Assets.icons.svg.icDashboardSearch.path,
                  isSelected: true),
              icon: IconItem(path: Assets.icons.svg.icDashboardSearch.path),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              activeIcon: IconItem(
                  path: Assets.icons.svg.icDashboardProfile.path,
                  isSelected: true),
              icon: IconItem(path: Assets.icons.svg.icDashboardProfile.path),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
