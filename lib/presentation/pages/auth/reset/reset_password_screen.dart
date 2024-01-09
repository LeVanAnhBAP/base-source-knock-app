import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import '../../../../assets.gen.dart';
import '../../../widgets/input_field.dart';
import '../../../widgets/log_button.dart';


@RoutePage()
class ResetPassPage extends StatefulWidget {
  const ResetPassPage({super.key});

  @override
  State<StatefulWidget> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPassPage> {
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: SingleChildScrollView(
        child: Container(
          height: 560,
          margin:  EdgeInsets.only(left: 20, right: 20, top: MediaQuery.of(context).size.height/8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset( Assets.icons.png.icKnock.path),
               Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'パスワード再設定用メール送信',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Gap(8)
                    ],
                  ),
                  const Gap(40),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('パスワードをお忘れの方は'),
                      Text('ご登録いただいているメールアドレスをご入力ください。'),
                      Gap(20),
                      Text('再設定手続き用のURLが記載されたメールを送信いたします。'),
                    ],
                  ),
                  const Gap(40),
                  InputField(textFieldHintText: 'メールアドレス', controller: emailController,),
                ],
              ),

              LogButton(
                color: Colors.indigo,
                buttonName: 'メールを送信する',
                onClick: () {
                  // context.router.push( const NewPassRoute());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
