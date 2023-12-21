import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/core/languages/translation_keys.g.dart';

import 'package:uq_system_app/presentation/navigation/navigation.dart';

import 'widgets/icon_item.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DashboardPageState();
  }
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        DashboardHomeRoute(),
        DashboardAccountRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) => BottomNavigationBar(
        selectedItemColor: context.colors.secondary,
        currentIndex: tabsRouter.activeIndex,
        onTap: tabsRouter.setActiveIndex,
        items: [
          BottomNavigationBarItem(
            activeIcon: IconItem(
                path: Assets.icons.svg.icDashboardHome.path,
                isSelected: tabsRouter.activeIndex == 0),
            icon: IconItem(path: Assets.icons.svg.icDashboardHome.path),
            label: context.tr(LocaleKeys.Dashboard_Home),
          ),
          BottomNavigationBarItem(
            activeIcon: IconItem(
                path: Assets.icons.svg.icDashboardOnsite.path,
                isSelected: tabsRouter.activeIndex == 1),
            icon: IconItem(path: Assets.icons.svg.icDashboardOnsite.path),
            label: context.tr(LocaleKeys.Dashboard_OnSite),
          ),
        ],
      ),
    );
  }
}
