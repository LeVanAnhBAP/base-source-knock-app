import 'dart:async';


import 'package:get_it/get_it.dart';
import 'package:uq_system_app/di/injection.config.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/di/manual_inject.dart';

final getIt = GetIt.instance;

// Future injectDependencies() async {
//   await registerModules();
//   await registerServices();
//   await registerDataSources();
//   await registerRepositories();
//   await registerUseCases();
//   await registerStates();
// }


@InjectableInit()  
Future<void> configureInjection(String env) async {
  await getIt.init(environment: env);
  await manualRegister();
} 
