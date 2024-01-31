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
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    NewPassRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewPassPage(),
      );
    },
    ResetPassRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ResetPassPage(),
      );
    },
    DashboardChatRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardChatPage(),
      );
    },
    CreateSiteRoute.name: (routeData) {
      final args = routeData.argsAs<CreateSiteRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreateSitePage(
          siteID: args.siteID,
          accessToken: args.accessToken,
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      final args = routeData.argsAs<DashboardRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DashboardPage(
          key: args.key,
          accessToken: args.accessToken,
        ),
      );
    },
    DashboardHomeRoute.name: (routeData) {
      final args = routeData.argsAs<DashboardHomeRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DashboardHomePage(
          key: args.key,
          accessToken: args.accessToken,
        ),
      );
    },
    NegotiationRoomRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NegotiationRoomPage(),
      );
    },
    NotificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NotificationPage(),
      );
    },
    DashboardProfileRoute.name: (routeData) {
      final args = routeData.argsAs<DashboardProfileRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DashboardProfilePage(accessToken: args.accessToken),
      );
    },
    DashboardSearchRoute.name: (routeData) {
      final args = routeData.argsAs<DashboardSearchRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DashboardSearchPage(
          key: args.key,
          accessToken: args.accessToken,
        ),
      );
    },
    DashboardSiteRoute.name: (routeData) {
      final args = routeData.argsAs<DashboardSiteRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DashboardSitePage(
          key: args.key,
          accessToken: args.accessToken,
        ),
      );
    },
    SiteDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<SiteDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SiteDetailsPage(
          id: args.id,
          accessToken: args.accessToken,
        ),
      );
    },
  };
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
/// [NewPassPage]
class NewPassRoute extends PageRouteInfo<void> {
  const NewPassRoute({List<PageRouteInfo>? children})
      : super(
          NewPassRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewPassRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ResetPassPage]
class ResetPassRoute extends PageRouteInfo<void> {
  const ResetPassRoute({List<PageRouteInfo>? children})
      : super(
          ResetPassRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPassRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardChatPage]
class DashboardChatRoute extends PageRouteInfo<void> {
  const DashboardChatRoute({List<PageRouteInfo>? children})
      : super(
          DashboardChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardChatRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateSitePage]
class CreateSiteRoute extends PageRouteInfo<CreateSiteRouteArgs> {
  CreateSiteRoute({
    required int siteID,
    required String accessToken,
    List<PageRouteInfo>? children,
  }) : super(
          CreateSiteRoute.name,
          args: CreateSiteRouteArgs(
            siteID: siteID,
            accessToken: accessToken,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateSiteRoute';

  static const PageInfo<CreateSiteRouteArgs> page =
      PageInfo<CreateSiteRouteArgs>(name);
}

class CreateSiteRouteArgs {
  const CreateSiteRouteArgs({
    required this.siteID,
    required this.accessToken,
  });

  final int siteID;

  final String accessToken;

  @override
  String toString() {
    return 'CreateSiteRouteArgs{siteID: $siteID, accessToken: $accessToken}';
  }
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<DashboardRouteArgs> {
  DashboardRoute({
    Key? key,
    required String accessToken,
    List<PageRouteInfo>? children,
  }) : super(
          DashboardRoute.name,
          args: DashboardRouteArgs(
            key: key,
            accessToken: accessToken,
          ),
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<DashboardRouteArgs> page =
      PageInfo<DashboardRouteArgs>(name);
}

class DashboardRouteArgs {
  const DashboardRouteArgs({
    this.key,
    required this.accessToken,
  });

  final Key? key;

  final String accessToken;

  @override
  String toString() {
    return 'DashboardRouteArgs{key: $key, accessToken: $accessToken}';
  }
}

/// generated route for
/// [DashboardHomePage]
class DashboardHomeRoute extends PageRouteInfo<DashboardHomeRouteArgs> {
  DashboardHomeRoute({
    Key? key,
    required String accessToken,
    List<PageRouteInfo>? children,
  }) : super(
          DashboardHomeRoute.name,
          args: DashboardHomeRouteArgs(
            key: key,
            accessToken: accessToken,
          ),
          initialChildren: children,
        );

  static const String name = 'DashboardHomeRoute';

  static const PageInfo<DashboardHomeRouteArgs> page =
      PageInfo<DashboardHomeRouteArgs>(name);
}

class DashboardHomeRouteArgs {
  const DashboardHomeRouteArgs({
    this.key,
    required this.accessToken,
  });

  final Key? key;

  final String accessToken;

  @override
  String toString() {
    return 'DashboardHomeRouteArgs{key: $key, accessToken: $accessToken}';
  }
}

/// generated route for
/// [NegotiationRoomPage]
class NegotiationRoomRoute extends PageRouteInfo<void> {
  const NegotiationRoomRoute({List<PageRouteInfo>? children})
      : super(
          NegotiationRoomRoute.name,
          initialChildren: children,
        );

  static const String name = 'NegotiationRoomRoute';

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
/// [DashboardProfilePage]
class DashboardProfileRoute extends PageRouteInfo<DashboardProfileRouteArgs> {
  DashboardProfileRoute({
    required String accessToken,
    List<PageRouteInfo>? children,
  }) : super(
          DashboardProfileRoute.name,
          args: DashboardProfileRouteArgs(accessToken: accessToken),
          initialChildren: children,
        );

  static const String name = 'DashboardProfileRoute';

  static const PageInfo<DashboardProfileRouteArgs> page =
      PageInfo<DashboardProfileRouteArgs>(name);
}

class DashboardProfileRouteArgs {
  const DashboardProfileRouteArgs({required this.accessToken});

  final String accessToken;

  @override
  String toString() {
    return 'DashboardProfileRouteArgs{accessToken: $accessToken}';
  }
}

/// generated route for
/// [DashboardSearchPage]
class DashboardSearchRoute extends PageRouteInfo<DashboardSearchRouteArgs> {
  DashboardSearchRoute({
    Key? key,
    required String accessToken,
    List<PageRouteInfo>? children,
  }) : super(
          DashboardSearchRoute.name,
          args: DashboardSearchRouteArgs(
            key: key,
            accessToken: accessToken,
          ),
          initialChildren: children,
        );

  static const String name = 'DashboardSearchRoute';

  static const PageInfo<DashboardSearchRouteArgs> page =
      PageInfo<DashboardSearchRouteArgs>(name);
}

class DashboardSearchRouteArgs {
  const DashboardSearchRouteArgs({
    this.key,
    required this.accessToken,
  });

  final Key? key;

  final String accessToken;

  @override
  String toString() {
    return 'DashboardSearchRouteArgs{key: $key, accessToken: $accessToken}';
  }
}

/// generated route for
/// [DashboardSitePage]
class DashboardSiteRoute extends PageRouteInfo<DashboardSiteRouteArgs> {
  DashboardSiteRoute({
    Key? key,
    required String accessToken,
    List<PageRouteInfo>? children,
  }) : super(
          DashboardSiteRoute.name,
          args: DashboardSiteRouteArgs(
            key: key,
            accessToken: accessToken,
          ),
          initialChildren: children,
        );

  static const String name = 'DashboardSiteRoute';

  static const PageInfo<DashboardSiteRouteArgs> page =
      PageInfo<DashboardSiteRouteArgs>(name);
}

class DashboardSiteRouteArgs {
  const DashboardSiteRouteArgs({
    this.key,
    required this.accessToken,
  });

  final Key? key;

  final String accessToken;

  @override
  String toString() {
    return 'DashboardSiteRouteArgs{key: $key, accessToken: $accessToken}';
  }
}

/// generated route for
/// [SiteDetailsPage]
class SiteDetailsRoute extends PageRouteInfo<SiteDetailsRouteArgs> {
  SiteDetailsRoute({
    required String id,
    required String accessToken,
    List<PageRouteInfo>? children,
  }) : super(
          SiteDetailsRoute.name,
          args: SiteDetailsRouteArgs(
            id: id,
            accessToken: accessToken,
          ),
          initialChildren: children,
        );

  static const String name = 'SiteDetailsRoute';

  static const PageInfo<SiteDetailsRouteArgs> page =
      PageInfo<SiteDetailsRouteArgs>(name);
}

class SiteDetailsRouteArgs {
  const SiteDetailsRouteArgs({
    required this.id,
    required this.accessToken,
  });

  final String id;

  final String accessToken;

  @override
  String toString() {
    return 'SiteDetailsRouteArgs{id: $id, accessToken: $accessToken}';
  }
}
