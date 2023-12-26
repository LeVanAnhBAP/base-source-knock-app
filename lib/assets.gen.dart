/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsAudiosGen {
  const $AssetsAudiosGen();

  /// File path: assets/audios/.gitkeep
  String get gitkeep => 'assets/audios/.gitkeep';

  /// List of all assets
  List<String> get values => [gitkeep];
}

class $AssetsFilesGen {
  const $AssetsFilesGen();

  /// File path: assets/files/.gitkeep
  String get gitkeep => 'assets/files/.gitkeep';

  /// List of all assets
  List<String> get values => [gitkeep];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  $AssetsIconsPngGen get png => const $AssetsIconsPngGen();
  $AssetsIconsSvgGen get svg => const $AssetsIconsSvgGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/.gitkeep
  String get gitkeep => 'assets/images/.gitkeep';

  /// File path: assets/images/img_app_logo.png
  AssetGenImage get imgAppLogo => const AssetGenImage('assets/images/img_app_logo.png');

  /// File path: assets/images/img_building_logo.png
  AssetGenImage get imgBuildingLogo => const AssetGenImage('assets/images/img_building_logo.png');

  /// List of all assets
  List<dynamic> get values => [gitkeep, imgAppLogo, imgBuildingLogo];
}

class $AssetsIconsPngGen {
  const $AssetsIconsPngGen();

  /// File path: assets/icons/png/.gitkeep
  String get gitkeep => 'assets/icons/png/.gitkeep';

  /// File path: assets/icons/png/ic_dashboard_chat.png
  AssetGenImage get icDashboardChat =>
      const AssetGenImage('assets/icons/png/ic_dashboard_chat.png');

  /// File path: assets/icons/png/ic_dashboard_home.png
  AssetGenImage get icDashboardHome =>
      const AssetGenImage('assets/icons/png/ic_dashboard_home.png');

  /// File path: assets/icons/png/ic_dashboard_onsite.png
  AssetGenImage get icDashboardOnsite =>
      const AssetGenImage('assets/icons/png/ic_dashboard_onsite.png');

  /// File path: assets/icons/png/ic_dashboard_profile.png
  AssetGenImage get icDashboardProfile =>
      const AssetGenImage('assets/icons/png/ic_dashboard_profile.png');

  /// File path: assets/icons/png/ic_dashboard_search.png
  AssetGenImage get icDashboardSearch =>
      const AssetGenImage('assets/icons/png/ic_dashboard_search.png');

  /// File path: assets/icons/png/ic_invisible.png
  AssetGenImage get icInvisible => const AssetGenImage('assets/icons/png/ic_invisible.png');

  /// File path: assets/icons/png/ic_visible.png
  AssetGenImage get icVisible => const AssetGenImage('assets/icons/png/ic_visible.png');

  /// List of all assets
  List<dynamic> get values => [
        gitkeep,
        icDashboardChat,
        icDashboardHome,
        icDashboardOnsite,
        icDashboardProfile,
        icDashboardSearch,
        icInvisible,
        icVisible
      ];
}

class $AssetsIconsSvgGen {
  const $AssetsIconsSvgGen();

  /// File path: assets/icons/svg/.gitkeep
  String get gitkeep => 'assets/icons/svg/.gitkeep';

  /// File path: assets/icons/svg/ic_calendar.svg
  SvgGenImage get icCalendar => const SvgGenImage('assets/icons/svg/ic_calendar.svg');

  /// File path: assets/icons/svg/ic_dashboard_account.svg
  SvgGenImage get icDashboardAccount =>
      const SvgGenImage('assets/icons/svg/ic_dashboard_account.svg');

  /// File path: assets/icons/svg/ic_dashboard_chat.svg
  SvgGenImage get icDashboardChat => const SvgGenImage('assets/icons/svg/ic_dashboard_chat.svg');

  /// File path: assets/icons/svg/ic_dashboard_home.svg
  SvgGenImage get icDashboardHome => const SvgGenImage('assets/icons/svg/ic_dashboard_home.svg');

  /// File path: assets/icons/svg/ic_dashboard_onsite.svg
  SvgGenImage get icDashboardOnsite =>
      const SvgGenImage('assets/icons/svg/ic_dashboard_onsite.svg');

  /// File path: assets/icons/svg/ic_dashboard_profile.svg
  SvgGenImage get icDashboardProfile =>
      const SvgGenImage('assets/icons/svg/ic_dashboard_profile.svg');

  /// File path: assets/icons/svg/ic_dashboard_search.svg
  SvgGenImage get icDashboardSearch =>
      const SvgGenImage('assets/icons/svg/ic_dashboard_search.svg');

  /// File path: assets/icons/svg/ic_location.svg
  SvgGenImage get icLocation => const SvgGenImage('assets/icons/svg/ic_location.svg');

  /// File path: assets/icons/svg/ic_search.svg
  SvgGenImage get icSearch => const SvgGenImage('assets/icons/svg/ic_search.svg');

  /// File path: assets/icons/svg/ic_under_construction.svg
  SvgGenImage get icUnderConstruction =>
      const SvgGenImage('assets/icons/svg/ic_under_construction.svg');

  /// List of all assets
  List<dynamic> get values => [
        gitkeep,
        icCalendar,
        icDashboardAccount,
        icDashboardChat,
        icDashboardHome,
        icDashboardOnsite,
        icDashboardProfile,
        icDashboardSearch,
        icLocation,
        icSearch,
        icUnderConstruction
      ];
}

class Assets {
  Assets._();

  static const $AssetsAudiosGen audios = $AssetsAudiosGen();
  static const $AssetsFilesGen files = $AssetsFilesGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
