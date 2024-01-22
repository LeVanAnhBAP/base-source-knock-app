import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:uq_system_app/presentation/pages/auth/login/login_screens.dart';
import 'package:uq_system_app/presentation/pages/auth/new_password/new_password_screen.dart';
import 'package:uq_system_app/presentation/pages/auth/reset/reset_password_screen.dart';
import 'package:uq_system_app/presentation/pages/dashboard/chat/chat.dart';
import 'package:uq_system_app/presentation/pages/dashboard/dashboard.dart';
import 'package:uq_system_app/presentation/pages/dashboard/home/home.dart';
import 'package:uq_system_app/presentation/pages/dashboard/notification/notification.dart';
import 'package:uq_system_app/presentation/pages/dashboard/profile/profile.dart';
import 'package:uq_system_app/presentation/pages/dashboard/search/search.dart';
import 'package:uq_system_app/presentation/pages/dashboard/site/site.dart';
import 'package:uq_system_app/presentation/pages/dashboard/negotiationRoom/negotiation_room.dart';
import 'package:uq_system_app/presentation/pages/dashboard/createSite/create_site.dart';
import 'package:uq_system_app/presentation/pages/dashboard/siteDetails/site_details.dart';
part 'navigation.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: LoginRoute.page, initial: true),
    AutoRoute( page: DashboardRoute.page, children: [
      AutoRoute( page: DashboardHomeRoute.page),
      AutoRoute( page: DashboardSiteRoute.page),
      AutoRoute( page: DashboardChatRoute.page),
      AutoRoute( page: DashboardSearchRoute.page),
      AutoRoute( page: DashboardProfileRoute.page),
    ]),
    AutoRoute(page: ResetPassRoute.page),
    AutoRoute(page: NewPassRoute.page),
    AutoRoute(page: NegotiationRoomRoute.page),
    AutoRoute(page: NotificationRoute.page),
    AutoRoute(page: SiteDetailsRoute.page),
    AutoRoute(page: CreateSiteRoute.page)
  ];

  @override
  RouteType get defaultRouteType => const RouteType.cupertino();
}
