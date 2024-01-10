import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/core/exceptions/network_exception.dart';
import 'package:uq_system_app/core/exceptions/unknown_exception.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/core/languages/translation_keys.g.dart';

class Utils {
  static String baseExceptionToString(BuildContext context, BaseException? e) {
    if (e is NetworkException) {
      return context.tr(LocaleKeys.Errors_NetworkError);
    }
    if (e is UnknownException) {
      return e.data ?? context.tr(LocaleKeys.Errors_NetworkError);
    }
    return context.tr(LocaleKeys.Errors_NetworkError);
  }

  static String siteStatusToIconPath(int status) {
    switch (status) {
      case 0:
      case 1:
        return Assets.icons.svg.icSiteStatus1.path;
      case 2:
        return Assets.icons.svg.icSiteStatus2.path;
      case 3:
        return Assets.icons.svg.icSiteStatus3.path;
      case 4:
        return Assets.icons.svg.icSiteStatus4.path;
      case 5:
        return Assets.icons.svg.icSiteStatus5.path;
      case 6:
        return Assets.icons.svg.icSiteStatus6.path;
      case 7:
        return Assets.icons.svg.icSiteStatus7.path;
    }
    return Assets.icons.svg.icSiteStatus1.path;
  }

  static Color siteStatusToColor(int status, BuildContext context) {
    switch (status) {
      case 2:
      case 7:
        return context.colors.tertiary;
      case 4:
        return context.colors.quaternary;
      default:
        return context.colors.secondary;
    }
  }

  static String siteStatusToString(BuildContext context,int status, int companyType) {
    switch (status) {
      case 0:
      case 1:
        return context.tr(LocaleKeys.OnSite_NotOrdering);
      case 2:
        return context.tr(LocaleKeys.OnSite_Ordered);
      case 3:
        return context.tr(LocaleKeys.OnSite_HopingToReceiveOrders);
      case 4:
        {
          if (companyType == 1) {
            return context.tr(LocaleKeys.OnSite_OrderConfirmed1);
          } else {
            return context.tr(LocaleKeys.OnSite_OrderConfirmed2);
          }
        }
      case 5:
        return context.tr(LocaleKeys.OnSite_UnderImplementation);
      case 6:
        return context.tr(LocaleKeys.OnSite_AcceptanceInspectionRequest);
      case 7:
        return context.tr(LocaleKeys.OnSite_EnforcementCompleted);
    }
    return "";
  }

 static String joinDataWithSeparator(BuildContext context,List<String> data, [String separator = '/']) {
  if (data.isEmpty) {
    return context.tr(LocaleKeys.InformationNotEntered);
  }
  return data.join(separator);
}

  static bool isDateExpired(String dateString){
    DateTime dateTimeFromStr = DateTime.parse(dateString);
    return dateTimeFromStr.isBefore(DateTime.now());
  }
}
