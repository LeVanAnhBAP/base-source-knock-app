import 'package:auto_route/auto_route.dart';
import 'package:uq_system_app/presentation/pages/auth/reset_password/reset_password_page.dart';
import 'package:uq_system_app/presentation/pages/auth/new_password/new_password_page.dart';
import 'package:uq_system_app/presentation/pages/auth/login/login_page.dart';
import 'package:uq_system_app/presentation/pages/dashboard/account/account.dart';
import 'package:uq_system_app/presentation/pages/dashboard/dashboard.dart';
import 'package:uq_system_app/presentation/pages/dashboard/home/home.dart';

part 'navigation.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter{

  
  @override
  final List<AutoRoute> routes = [
    AutoRoute(path: '/login', page: LoginRoute.page, initial: true),
    AutoRoute(path: '/resetpassword', page: ResetPasswordRoute.page),
    AutoRoute(path: '/newpassword', page: NewPasswordRoute.page),
    AutoRoute(path: '/dashboard', page: DashboardRoute.page, children: [
      AutoRoute(path: 'home', page: DashboardHomeRoute.page),
      AutoRoute(path: 'account', page: DashboardAccountRoute.page),
    ]),
  ];
@override
  RouteType get defaultRouteType => const RouteType.material();
}
