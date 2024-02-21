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
        child: CreateSitePage(siteID: args.siteID),
      );
    },
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardPage(),
      );
    },
    DashboardHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardHomePage(),
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
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardProfilePage(),
      );
    },
    DashboardSearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardSearchPage(),
      );
    },
    DashboardSiteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardSitePage(),
      );
    },
    SiteDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<SiteDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SiteDetailsPage(id: args.id),
      );
    },
    EditCompanyInfoRoute.name: (routeData) {
      final args = routeData.argsAs<EditCompanyInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditCompanyInfoPage(companyInfo: args.companyInfo),
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
    List<PageRouteInfo>? children,
  }) : super(
          CreateSiteRoute.name,
          args: CreateSiteRouteArgs(siteID: siteID),
          initialChildren: children,
        );

  static const String name = 'CreateSiteRoute';

  static const PageInfo<CreateSiteRouteArgs> page =
      PageInfo<CreateSiteRouteArgs>(name);
}

class CreateSiteRouteArgs {
  const CreateSiteRouteArgs({required this.siteID});

  final int siteID;

  @override
  String toString() {
    return 'CreateSiteRouteArgs{siteID: $siteID}';
  }
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
class DashboardProfileRoute extends PageRouteInfo<void> {
  const DashboardProfileRoute({List<PageRouteInfo>? children})
      : super(
          DashboardProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardSearchPage]
class DashboardSearchRoute extends PageRouteInfo<void> {
  const DashboardSearchRoute({List<PageRouteInfo>? children})
      : super(
          DashboardSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardSearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardSitePage]
class DashboardSiteRoute extends PageRouteInfo<void> {
  const DashboardSiteRoute({List<PageRouteInfo>? children})
      : super(
          DashboardSiteRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardSiteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SiteDetailsPage]
class SiteDetailsRoute extends PageRouteInfo<SiteDetailsRouteArgs> {
  SiteDetailsRoute({
    required String id,
    List<PageRouteInfo>? children,
  }) : super(
          SiteDetailsRoute.name,
          args: SiteDetailsRouteArgs(id: id),
          initialChildren: children,
        );

  static const String name = 'SiteDetailsRoute';

  static const PageInfo<SiteDetailsRouteArgs> page =
      PageInfo<SiteDetailsRouteArgs>(name);
}

class SiteDetailsRouteArgs {
  const SiteDetailsRouteArgs({required this.id});

  final String id;

  @override
  String toString() {
    return 'SiteDetailsRouteArgs{id: $id}';
  }
}

/// generated route for
/// [EditCompanyInfoPage]
class EditCompanyInfoRoute extends PageRouteInfo<EditCompanyInfoRouteArgs> {
  EditCompanyInfoRoute({
    required Map<String, dynamic> companyInfo,
    List<PageRouteInfo>? children,
  }) : super(
          EditCompanyInfoRoute.name,
          args: EditCompanyInfoRouteArgs(companyInfo: companyInfo),
          initialChildren: children,
        );

  static const String name = 'EditCompanyInfoRoute';

  static const PageInfo<EditCompanyInfoRouteArgs> page =
      PageInfo<EditCompanyInfoRouteArgs>(name);
}

class EditCompanyInfoRouteArgs {
  const EditCompanyInfoRouteArgs({required this.companyInfo});

  final Map<String, dynamic> companyInfo;

  @override
  String toString() {
    return 'EditCompanyInfoRouteArgs{companyInfo: $companyInfo}';
  }
}
