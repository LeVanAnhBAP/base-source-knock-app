
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/core/exceptions/network_exception.dart';
import 'package:uq_system_app/core/exceptions/unknown_exception.dart';
import 'package:uq_system_app/core/languages/translation_keys.g.dart';

class Utils{
  static String baseExceptionToString(BuildContext context,BaseException? e){
    if(e is NetworkException) return context.tr(LocaleKeys.Errors_NetworkError);
    if(e is UnknownException){
      return e.data ?? context.tr(LocaleKeys.Errors_NetworkError);
    }
    return context.tr(LocaleKeys.Errors_NetworkError);
  }
}