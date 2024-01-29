// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'navigation.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CreateSiteRoute.name: (routeData) {
      final args = routeData.argsAs<CreateSiteRouteArgs>(
          orElse: () => const CreateSiteRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreateSitePage(
          siteId: args.siteId,
          isDraft: args.isDraft,
          isCopy: args.isCopy,
        ),
      );
    },
    DashBoardChatRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DashBoardChatPage(),
      );
    },
    DashBoardOnSiteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DashBoardOnSitePage(),
      );
    },
    DashBoardProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DashBoardProfilePage(),
      );
    },
    DashBoardSearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DashBoardSearchPage(),
      );
    },
    DashboardAccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DashboardAccountPage(),
      );
    },
    DashboardHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardHomePage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    NotificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NotificationPage(),
      );
    },
    OccupationRoute.name: (routeData) {
      final args = routeData.argsAs<OccupationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OccupationPage(
          args.occupations,
          args.selectedOccupation,
        ),
      );
    },
    OrderDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<OrderDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OrderDetailsPage(
          args.taxRate,
          args.orders,
          args.units,
        ),
      );
    },
    OrderLineRoute.name: (routeData) {
      final args = routeData.argsAs<OrderLineRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OrderLinePage(
          args.params,
          args.units,
        ),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ResetPasswordPage(),
      );
    },
    ScheduleDetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScheduleDetailsPage(),
      );
    },
    SearchMemberRoute.name: (routeData) {
      final args = routeData.argsAs<SearchMemberRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SearchMemberPage(args.members),
      );
    },
    SiteDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<SiteDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SiteDetailsPage(args.siteId),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    WorkerMapRoute.name: (routeData) {
      final args = routeData.argsAs<WorkerMapRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WorkerMapPage(args.siteId),
      );
    },
  };
}

/// generated route for
/// [CreateSitePage]
class CreateSiteRoute extends PageRouteInfo<CreateSiteRouteArgs> {
  CreateSiteRoute({
    int? siteId,
    bool isDraft = false,
    bool isCopy = false,
    List<PageRouteInfo>? children,
  }) : super(
          CreateSiteRoute.name,
          args: CreateSiteRouteArgs(
            siteId: siteId,
            isDraft: isDraft,
            isCopy: isCopy,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateSiteRoute';

  static const PageInfo<CreateSiteRouteArgs> page =
      PageInfo<CreateSiteRouteArgs>(name);
}

class CreateSiteRouteArgs {
  const CreateSiteRouteArgs({
    this.siteId,
    this.isDraft = false,
    this.isCopy = false,
  });

  final int? siteId;

  final bool isDraft;

  final bool isCopy;

  @override
  String toString() {
    return 'CreateSiteRouteArgs{siteId: $siteId, isDraft: $isDraft, isCopy: $isCopy}';
  }
}

/// generated route for
/// [DashBoardChatPage]
class DashBoardChatRoute extends PageRouteInfo<void> {
  const DashBoardChatRoute({List<PageRouteInfo>? children})
      : super(
          DashBoardChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashBoardChatRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashBoardOnSitePage]
class DashBoardOnSiteRoute extends PageRouteInfo<void> {
  const DashBoardOnSiteRoute({List<PageRouteInfo>? children})
      : super(
          DashBoardOnSiteRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashBoardOnSiteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashBoardProfilePage]
class DashBoardProfileRoute extends PageRouteInfo<void> {
  const DashBoardProfileRoute({List<PageRouteInfo>? children})
      : super(
          DashBoardProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashBoardProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashBoardSearchPage]
class DashBoardSearchRoute extends PageRouteInfo<void> {
  const DashBoardSearchRoute({List<PageRouteInfo>? children})
      : super(
          DashBoardSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashBoardSearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardAccountPage]
class DashboardAccountRoute extends PageRouteInfo<void> {
  const DashboardAccountRoute({List<PageRouteInfo>? children})
      : super(
          DashboardAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardAccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardHomePage]
class DashboardHomeRoute extends PageRouteInfo<void> {
  const DashboardHomeRoute({List<PageRouteInfo>? children})
      : super(
          DashboardHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotificationPage]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute({List<PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OccupationPage]
class OccupationRoute extends PageRouteInfo<OccupationRouteArgs> {
  OccupationRoute({
    required List<OccupationMajorResponse> occupations,
    required OccupationResponse? selectedOccupation,
    List<PageRouteInfo>? children,
  }) : super(
          OccupationRoute.name,
          args: OccupationRouteArgs(
            occupations: occupations,
            selectedOccupation: selectedOccupation,
          ),
          initialChildren: children,
        );

  static const String name = 'OccupationRoute';

  static const PageInfo<OccupationRouteArgs> page =
      PageInfo<OccupationRouteArgs>(name);
}

class OccupationRouteArgs {
  const OccupationRouteArgs({
    required this.occupations,
    required this.selectedOccupation,
  });

  final List<OccupationMajorResponse> occupations;

  final OccupationResponse? selectedOccupation;

  @override
  String toString() {
    return 'OccupationRouteArgs{occupations: $occupations, selectedOccupation: $selectedOccupation}';
  }
}

/// generated route for
/// [OrderDetailsPage]
class OrderDetailsRoute extends PageRouteInfo<OrderDetailsRouteArgs> {
  OrderDetailsRoute({
    required double taxRate,
    required List<PriceOrderDetailModel> orders,
    required List<CommonItemResponse> units,
    List<PageRouteInfo>? children,
  }) : super(
          OrderDetailsRoute.name,
          args: OrderDetailsRouteArgs(
            taxRate: taxRate,
            orders: orders,
            units: units,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderDetailsRoute';

  static const PageInfo<OrderDetailsRouteArgs> page =
      PageInfo<OrderDetailsRouteArgs>(name);
}

class OrderDetailsRouteArgs {
  const OrderDetailsRouteArgs({
    required this.taxRate,
    required this.orders,
    required this.units,
  });

  final double taxRate;

  final List<PriceOrderDetailModel> orders;

  final List<CommonItemResponse> units;

  @override
  String toString() {
    return 'OrderDetailsRouteArgs{taxRate: $taxRate, orders: $orders, units: $units}';
  }
}

/// generated route for
/// [OrderLinePage]
class OrderLineRoute extends PageRouteInfo<OrderLineRouteArgs> {
  OrderLineRoute({
    required PriceOrderDetailModel? params,
    required List<CommonItemResponse> units,
    List<PageRouteInfo>? children,
  }) : super(
          OrderLineRoute.name,
          args: OrderLineRouteArgs(
            params: params,
            units: units,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderLineRoute';

  static const PageInfo<OrderLineRouteArgs> page =
      PageInfo<OrderLineRouteArgs>(name);
}

class OrderLineRouteArgs {
  const OrderLineRouteArgs({
    required this.params,
    required this.units,
  });

  final PriceOrderDetailModel? params;

  final List<CommonItemResponse> units;

  @override
  String toString() {
    return 'OrderLineRouteArgs{params: $params, units: $units}';
  }
}

/// generated route for
/// [ResetPasswordPage]
class ResetPasswordRoute extends PageRouteInfo<void> {
  const ResetPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScheduleDetailsPage]
class ScheduleDetailsRoute extends PageRouteInfo<void> {
  const ScheduleDetailsRoute({List<PageRouteInfo>? children})
      : super(
          ScheduleDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScheduleDetailsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchMemberPage]
class SearchMemberRoute extends PageRouteInfo<SearchMemberRouteArgs> {
  SearchMemberRoute({
    required List<Member> members,
    List<PageRouteInfo>? children,
  }) : super(
          SearchMemberRoute.name,
          args: SearchMemberRouteArgs(members: members),
          initialChildren: children,
        );

  static const String name = 'SearchMemberRoute';

  static const PageInfo<SearchMemberRouteArgs> page =
      PageInfo<SearchMemberRouteArgs>(name);
}

class SearchMemberRouteArgs {
  const SearchMemberRouteArgs({required this.members});

  final List<Member> members;

  @override
  String toString() {
    return 'SearchMemberRouteArgs{members: $members}';
  }
}

/// generated route for
/// [SiteDetailsPage]
class SiteDetailsRoute extends PageRouteInfo<SiteDetailsRouteArgs> {
  SiteDetailsRoute({
    required int siteId,
    List<PageRouteInfo>? children,
  }) : super(
          SiteDetailsRoute.name,
          args: SiteDetailsRouteArgs(siteId: siteId),
          initialChildren: children,
        );

  static const String name = 'SiteDetailsRoute';

  static const PageInfo<SiteDetailsRouteArgs> page =
      PageInfo<SiteDetailsRouteArgs>(name);
}

class SiteDetailsRouteArgs {
  const SiteDetailsRouteArgs({required this.siteId});

  final int siteId;

  @override
  String toString() {
    return 'SiteDetailsRouteArgs{siteId: $siteId}';
  }
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WorkerMapPage]
class WorkerMapRoute extends PageRouteInfo<WorkerMapRouteArgs> {
  WorkerMapRoute({
    required int siteId,
    List<PageRouteInfo>? children,
  }) : super(
          WorkerMapRoute.name,
          args: WorkerMapRouteArgs(siteId: siteId),
          initialChildren: children,
        );

  static const String name = 'WorkerMapRoute';

  static const PageInfo<WorkerMapRouteArgs> page =
      PageInfo<WorkerMapRouteArgs>(name);
}

class WorkerMapRouteArgs {
  const WorkerMapRouteArgs({required this.siteId});

  final int siteId;

  @override
  String toString() {
    return 'WorkerMapRouteArgs{siteId: $siteId}';
  }
}
