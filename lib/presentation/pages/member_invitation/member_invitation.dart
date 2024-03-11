import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/member_invitation/member_invitation_bloc.dart';
import 'package:uq_system_app/presentation/widgets/base_app_bar.dart';
import 'package:uq_system_app/presentation/widgets/divider_line.dart';
import 'package:uq_system_app/presentation/widgets/main_text_field.dart';

@RoutePage()
class MemberInvitationPage extends StatefulWidget {
  @override
  State<MemberInvitationPage> createState() => _MemberInvitationPageState();
}

class _MemberInvitationPageState extends State<MemberInvitationPage> {
  final MemberInvitationBloc _bloc = getIt.get<MemberInvitationBloc>();

  @override
  void dispose() {
    _bloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          context,
          titleText: "メンバー招待",
        ),
        body: Column(
          children: [
            const DividerLine(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "招待したい方のメールアドレスを入力し、\n送信ボタンを押してください。",
                        textAlign: TextAlign.center,
                        style: context.typographies.body,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "注意：",
                          style: context.typographies.subBody2
                              .withColor(Colors.red),
                        ),
                        Text(
                          "従業員の追加の場合は、\n下記の手順で行なってください。",
                          style: context.typographies.subBody2
                              .withColor(Colors.red),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "【アカウント情報】 ＞ 【＋（プラス）】 ＞ 追加",
                      style:
                          context.typographies.subBody2.withColor(Colors.red),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "招待する会社名称、屋号または氏名",
                      style: context.typographies.subBodyBold2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const MainTextField(),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "招待するメールアドレス",
                      style: context.typographies.subBodyBold2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const MainTextField(),
                    const Expanded(child: SizedBox()),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: ElevatedButton(
                          onPressed: () async {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: context.colors.secondary,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          child: Text(
                            "送信",
                            style: context.typographies.title3Bold
                                .withColor(Colors.white),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
