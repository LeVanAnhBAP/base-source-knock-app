import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/core/extensions/date_time.dart';
import 'package:uq_system_app/data/services/auth/auth.services.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:uq_system_app/presentation/blocs/auth/auth_event.dart';
import 'package:uq_system_app/presentation/blocs/auth/auth_selector.dart';
import 'package:uq_system_app/presentation/blocs/auth/auth_state.dart';
import 'package:uq_system_app/presentation/navigation/navigation.dart';
import 'package:uq_system_app/utils/utils.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    checkAuth();
  }

  checkAuth() async {
    var authService = getIt.get<AuthServices>();
    var tokenExpiresTime = await authService.getTokenExpiresTime();
    if (tokenExpiresTime != null && !Utils.isDateExpired(tokenExpiresTime)) {
      getIt<AuthBloc>().add(const AuthEvent.loadAccount());
    } else {
      Future.delayed(const Duration(milliseconds: 300), () {
        AutoRouter.of(context).replace(const LoginRoute());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.authStatus == AuthStatus.success) {

                AutoRouter.of(context).replace(const DashboardRoute());

            }

          },
        )
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: AssetGenImage(Assets.images.imgAppLogo.path).image(width: 200),
        ),
      ),
    );
  }
}
