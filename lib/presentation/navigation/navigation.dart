import 'package:auto_route/auto_route.dart';
import 'package:uq_system_app/data/models/price_order_detail_model.dart';
import 'package:uq_system_app/data/models/response/common_item_response.dart';
import 'package:uq_system_app/data/models/response/notification_response.dart';
import 'package:uq_system_app/data/models/response/occupation_major_response.dart';
import 'package:uq_system_app/data/models/response/occupation_response.dart';
import 'package:uq_system_app/domain/entities/member.dart';
import 'package:uq_system_app/presentation/pages/auth/reset_password/reset_password_page.dart';
import 'package:uq_system_app/presentation/pages/auth/login/login_page.dart';
import 'package:uq_system_app/presentation/pages/completion_report/completion_report.dart';
import 'package:uq_system_app/presentation/pages/contract_information/contract_information.dart';
import 'package:uq_system_app/presentation/pages/create_site/create_site.dart';
import 'package:uq_system_app/presentation/pages/dashboard/account/account.dart';
import 'package:uq_system_app/presentation/pages/dashboard/chat/chat.dart';
import 'package:uq_system_app/presentation/pages/dashboard/dashboard.dart';
import 'package:uq_system_app/presentation/pages/dashboard/home/home.dart';
import 'package:uq_system_app/presentation/pages/dashboard/on_site/on_site.dart';
import 'package:uq_system_app/presentation/pages/dashboard/profile/profile.dart';
import 'package:uq_system_app/presentation/pages/dashboard/search/search.dart';
import 'package:uq_system_app/presentation/pages/deal_room/deal_room.dart';
import 'package:uq_system_app/presentation/pages/invoice/invoice.dart';
import 'package:uq_system_app/presentation/pages/member_invitation/member_invitation.dart';
import 'package:uq_system_app/presentation/pages/notification/notification.dart';
import 'package:uq_system_app/presentation/pages/occupation/occupation.dart';
import 'package:uq_system_app/presentation/pages/order_details/order_details.dart';
import 'package:uq_system_app/presentation/pages/order_line/order_line.dart';
import 'package:uq_system_app/presentation/pages/schedule_details/schedule_details.dart';
import 'package:uq_system_app/presentation/pages/search_member/search_member.dart';
import 'package:uq_system_app/presentation/pages/site_details/site_details.dart';

import 'package:uq_system_app/presentation/pages/splash/splash.dart';
import 'package:uq_system_app/presentation/pages/worker_map/worker_map.dart';

import '../pages/chat_deal_room/chat_deal_room.dart';

part 'navigation.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter{

  
  @override
  final List<AutoRoute> routes = [
    AutoRoute(path: '/', page: SplashRoute.page, initial: true),
    AutoRoute(path: '/login', page: LoginRoute.page),
    AutoRoute(path: '/reset_password', page: ResetPasswordRoute.page),
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
    AutoRoute(path: '/create_site', page: CreateSiteRoute.page),
    AutoRoute(path: '/search_member', page: SearchMemberRoute.page),
    AutoRoute(path: '/occupation', page: OccupationRoute.page),
    AutoRoute(path: '/order_details', page: OrderDetailsRoute.page),
    AutoRoute(path: '/order_line', page: OrderLineRoute.page),
    AutoRoute(path: '/worker_map', page: WorkerMapRoute.page),
    AutoRoute(path: '/deal_room', page: DealRoomRoute.page),
    AutoRoute(path: '/chat_deal_room', page: ChatDealRoomRoute.page),
    AutoRoute(path: '/completion_report', page: CompletionReportRoute.page),
    AutoRoute(path: '/member_invitation', page: MemberInvitationRoute.page),
    AutoRoute(path: '/contract_information', page: ContractInformationRoute.page),
    AutoRoute(path: '/invoice', page: InvoiceRoute.page),
  ];
@override
  RouteType get defaultRouteType => const RouteType.material();
}
