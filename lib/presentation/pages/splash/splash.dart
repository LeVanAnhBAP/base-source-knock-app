import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/data/services/auth/auth.services.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/navigation/navigation.dart';

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
    if (await authService.getAccessToken() != null) {
      Future.delayed(const Duration(milliseconds: 300), () {
        AutoRouter.of(context).replace(const DashboardRoute());
      });
    } else {
      Future.delayed(const Duration(milliseconds: 300), () {
        AutoRouter.of(context).replace(const LoginRoute());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AssetGenImage(Assets.images.imgAppLogo.path).image(width: 200),
      ),
    );
  }
}
