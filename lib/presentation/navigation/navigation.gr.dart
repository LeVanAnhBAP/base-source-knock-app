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
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreateSitePage(),
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
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SiteDetailsPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
  };
}

/// generated route for
/// [CreateSitePage]
class CreateSiteRoute extends PageRouteInfo<void> {
  const CreateSiteRoute({List<PageRouteInfo>? children})
      : super(
          CreateSiteRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateSiteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
class SiteDetailsRoute extends PageRouteInfo<void> {
  const SiteDetailsRoute({List<PageRouteInfo>? children})
      : super(
          SiteDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SiteDetailsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
