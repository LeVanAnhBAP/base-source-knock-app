

import 'dart:async';

import 'package:uq_system_app/core/languages/languages.dart';
import 'package:uq_system_app/data/sources/local/local.dart';
import 'package:uq_system_app/data/usecases/save_language.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/blocs/system/system_bloc.dart';

FutureOr<void> manualRegister() async {
    getIt.registerSingleton<SystemBloc>(
    SystemBloc(
      getIt.get<SaveLanguage>(),
      locale: await getIt
          .get<LocalDataSource>() //
          .getLanguage()
          .then(AppLanguages.parseLanguage)
          .then((value) => value.locale),
    ),
  );
}