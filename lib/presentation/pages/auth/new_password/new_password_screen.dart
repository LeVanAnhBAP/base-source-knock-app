import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../assets.gen.dart';
import '../../../widgets/input_field.dart';
import '../../../widgets/log_button.dart';
import '../../dashboard/widgets/icon_item.dart';
@RoutePage()
class NewPassPage extends StatefulWidget {
  const NewPassPage({super.key});

  @override
  State<StatefulWidget> createState() => _NewPassWordState();
}

class _NewPassWordState extends State<NewPassPage> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController retypePassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: 560,
          margin:  EdgeInsets.only(left: 20, right: 20, top: MediaQuery.of(context).size.height/8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset( Assets.icons.png.icKnock.path),
               SizedBox(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'パスワード再設定',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    const Text(
                      '※8文字以上の半角英数記号で設定できます。',
                      style: TextStyle(color: Colors.red),
                    ),
                    Column(
                      children: [
                        InputField(textFieldHintText: '新しいパスワード', controller: newPasswordController,),
                        const Gap(16),
                        InputField(textFieldHintText: '新しいパスワード（確認用）', controller: retypePassword,)
                      ],
                    )
                  ],
                ),
              ),
              const Gap(40),
              LogButton(
                color: Colors.indigo,
                buttonName: 'パスワードを再設定する',
                onClick: () {

                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
