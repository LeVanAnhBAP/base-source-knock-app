import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/presentation/navigation/navigation.dart';
import '../../../../assets.gen.dart';
import '../../../widgets/input_field.dart';
import '../../../widgets/log_button.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void> login({required String email, required String password}) async {
    final BuildContext localContext = context;
    const api = 'https://dev-knock-api.oneknockapp.com/api/v1/user/auth/login';
    final data = {'email': email, 'password': password};
    final dio = Dio();
    dio.options.validateStatus = (status) => status! >= 200 && status < 300;
    try {
      Response response = await dio.post(api, data: data);
      if (response.statusCode == 200) {
        final body = response.data;
        final String accessToken = body['data']['access_token'].toString();
        localContext.router.replace( DashboardRoute(accessToken:accessToken));
        print('Response Body: ${response.data}');
        print('accessToken:$accessToken');
      } else {
        print('Response Body: ${response.data}');
      }
    } catch (e) {
      print('error:$e');
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('$e'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
              left: 20, right: 20, top: MediaQuery.of(context).size.height / 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: 240,
                  child: Image.asset(Assets.icons.png.icKnock.path)),
              InputField(
                textFieldHintText: 'ログインID(メールアドレス)',
                controller: emailController,
              ),
              const Gap(12),
              InputField(
                textFieldHintText: 'パスワード',
                controller: passwordController,
                obscureText: true,
              ),
              const Gap(16),
              TextButton(
                onPressed: () {
                  context.router.push(const ResetPassRoute());
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('パスワードを忘れた方はこちら',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.underline,
                        )),
                    Gap(20),
                  ],
                ),
              ),
              const Gap(16),
              LogButton(
                color: context.colors.alert,
                buttonName: 'ログイン',
                onClick: () {
                  login(
                      email: emailController.text,
                      password: passwordController.text);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
