import 'package:auto_route/auto_route.dart';
import 'package:uq_system_app/presentation/pages/auth/reset_password/reset_password_page.dart';
import 'package:uq_system_app/presentation/pages/auth/login/login_page.dart';
import 'package:uq_system_app/presentation/pages/create_site/create_site.dart';
import 'package:uq_system_app/presentation/pages/dashboard/account/account.dart';
import 'package:uq_system_app/presentation/pages/dashboard/chat/chat.dart';
import 'package:uq_system_app/presentation/pages/dashboard/dashboard.dart';
import 'package:uq_system_app/presentation/pages/dashboard/home/home.dart';
import 'package:uq_system_app/presentation/pages/dashboard/on_site/on_site.dart';
import 'package:uq_system_app/presentation/pages/dashboard/profile/profile.dart';
import 'package:uq_system_app/presentation/pages/dashboard/search/search.dart';
import 'package:uq_system_app/presentation/pages/notification/notification.dart';
import 'package:uq_system_app/presentation/pages/schedule_details/schedule_details.dart';
import 'package:uq_system_app/presentation/pages/search_member/search_member.dart';
import 'package:uq_system_app/presentation/pages/site_details/site_details.dart';

import 'package:uq_system_app/presentation/pages/splash/splash.dart';

part 'navigation.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter{

  
  @override
  final List<AutoRoute> routes = [
    AutoRoute(path: '/', page: SplashRoute.page, initial: true),
    AutoRoute(path: '/login', page: LoginRoute.page),
    AutoRoute(path: '/resetpassword', page: ResetPasswordRoute.page),
    AutoRoute(path: '/dashboard', page: DashboardRoute.page, children: [
      AutoRoute(path: 'home', page: DashboardHomeRoute.page),
      AutoRoute(path: 'onsite', page: DashBoardOnSiteRoute.page),
      AutoRoute(path: 'chat', page: DashBoardChatRoute.page),
      AutoRoute(path: 'search', page: DashBoardSearchRoute.page),
      AutoRoute(path: 'account', page: DashboardAccountRoute.page),
    ]),
    AutoRoute(path: '/notification', page: NotificationRoute.page),
    AutoRoute(path: '/schedule_details', page: ScheduleDetailsRoute.page),
    AutoRoute(path: '/site_details', page: SiteDetailsRoute.page),
    AutoRoute(path: '/site_details', page: CreateSiteRoute.page),
    AutoRoute(path: '/search_member', page: SearchMemberRoute.page),

  ];
@override
  RouteType get defaultRouteType => const RouteType.material();
}
