import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/core/languages/translation_keys.g.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/blocs/system/system_selector.dart';
import 'package:uq_system_app/presentation/blocs/system_notify/system_notify_event.dart';
import 'package:uq_system_app/presentation/blocs/system_notify/system_notify_selector.dart';

import 'package:uq_system_app/presentation/navigation/navigation.dart';

import '../../../core/bases/responses/base_error_response.dart';
import '../../../core/exceptions/unknown_exception.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../widgets/alert_dialog.dart';
import 'widgets/icon_item.dart';
import 'package:badges/badges.dart' as badges;

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DashboardPageState();
  }
}

final dashboardKey = GlobalKey<_DashboardPageState>();

class _DashboardPageState extends State<DashboardPage> {
  late int companyType;

  @override
  void initState() {
    super.initState();
    companyType = getIt.get<AuthBloc>().state.account?.company.type ?? 1;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        SystemErrorListener(
          listener: (error) {
            if (error is UnknownException) {
              var baseError = (error).error as BaseErrorResponse;
              showAlertDialog(
                  context: context,
                  messages: baseError.messages,
                  title: baseError.title);
            }
          },
        ),
      ],
      child: AutoTabsScaffold(
        routes: [
          const DashboardHomeRoute(),
          const DashBoardOnSiteRoute(),
          const DashBoardChatRoute(),
          if (companyType == 1) const DashBoardSearchRoute(),
          const DashboardAccountRoute(),
        ],
        bottomNavigationBuilder: (context, tabsRouter) => SystemNotifySelector(
          builder: (data) {
            return BottomNavigationBar(
              selectedItemColor: context.colors.secondary,
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
              items: [
                BottomNavigationBarItem(
                  activeIcon: badges.Badge(
                    showBadge: data?.unReadNotification ?? false,
                    child: IconItem(
                        path: Assets.icons.svg.icDashboardHome.path,
                        isSelected: tabsRouter.activeIndex == 0),
                  ),
                  icon: badges.Badge(
                      showBadge: data?.unReadNotification ?? false,
                      child: IconItem(
                          path: Assets.icons.svg.icDashboardHome.path)),
                  label: context.tr(LocaleKeys.Dashboard_Home),
                ),
                BottomNavigationBarItem(
                  activeIcon: IconItem(
                      path: Assets.icons.svg.icDashboardOnsite.path,
                      isSelected: tabsRouter.activeIndex == 1),
                  icon: IconItem(path: Assets.icons.svg.icDashboardOnsite.path),
                  label: context.tr(LocaleKeys.Dashboard_OnSite),
                ),
                BottomNavigationBarItem(
                  activeIcon: badges.Badge(
                    showBadge: (data?.unreadDealRoom ?? false) ||
                        (data?.unReadFactoryFloorRoom ?? false),
                    child: IconItem(
                        path: Assets.icons.svg.icDashboardChat.path,
                        isSelected: tabsRouter.activeIndex == 2),
                  ),
                  icon: badges.Badge(
                      showBadge: (data?.unreadDealRoom ?? false) ||
                          (data?.unReadFactoryFloorRoom ?? false),
                      child: IconItem(
                          path: Assets.icons.svg.icDashboardChat.path)),
                  label: context.tr(LocaleKeys.Dashboard_Chat),
                ),
                if (companyType == 1)
                  BottomNavigationBarItem(
                    activeIcon: IconItem(
                        path: Assets.icons.svg.icDashboardSearch.path,
                        isSelected: tabsRouter.activeIndex == 3),
                    icon:
                        IconItem(path: Assets.icons.svg.icDashboardSearch.path),
                    label: context.tr(LocaleKeys.Dashboard_Search),
                  ),
                BottomNavigationBarItem(
                  activeIcon: IconItem(
                      path: Assets.icons.svg.icDashboardProfile.path,
                      isSelected: tabsRouter.activeIndex == 4),
                  icon:
                      IconItem(path: Assets.icons.svg.icDashboardProfile.path),
                  label: context.tr(LocaleKeys.Dashboard_Chat),
                ),
              ],
            );
          },
          selector: (state) => state.unreadResponse,
        ),
      ),
    );
  }
}
