import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin:  EdgeInsets.only(left: 20, right: 20, top: MediaQuery.of(context).size.height/8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height:240,
                  child: Image.asset( Assets.icons.png.icKnock.path)),
              const InputField(textFieldHintText: 'ログインID(メールアドレス)'),
              const Gap(12),
              const InputField(textFieldHintText: 'パスワード'),
              const Gap(16),
              TextButton(
                onPressed: () {
                  context.router.push( const ResetPassRoute());
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
                color: Colors.orange,
                buttonName: 'ログイン',
                onClick: () {
                  context.router.push( const DashboardRoute());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
