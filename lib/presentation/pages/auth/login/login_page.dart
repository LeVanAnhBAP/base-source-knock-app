import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/di/injector.dart';
import 'package:uq_system_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:uq_system_app/presentation/navigation/navigation.dart';
import 'package:uq_system_app/presentation/widgets/main_text_field.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthBloc _bloc = provider.get<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 100,
          ),
          AssetGenImage(Assets.images.imgAppLogo.path).image(width: 200),
          const SizedBox(
            height: 40,
          ),
          _buildForm(),
        ]),
      ),
    );
  }

  Widget _buildForm() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const MainTextField(
            hintText: "ログインID(メールアドレス)",
          ),
          const SizedBox(
            height: 10,
          ),
          const MainTextField(
            hintText: "パスワード",
          ),
          const SizedBox(
            height: 19,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: GestureDetector(
              onTap: () {
                AutoRouter.of(context).push(const ResetPasswordRoute());
              },
              child: const Text(
                "パスワードを忘れた方はこちら",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xff4175B1),
                  fontSize: 16,
                  fontFamily: 'Hiragino',
                  color: Color(0xff4175B1),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: (){
              AutoRouter.of(context).push(const DashboardHomeRoute());
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.2,
                    blurRadius: 1,
                    offset: const Offset(0, 3),
                  )
                ],
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffFFAD0E),
              ),
              child: const Center(
                child: Text(
                  "ログイン",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Hiragino',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
