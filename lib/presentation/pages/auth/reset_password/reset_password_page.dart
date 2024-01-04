import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/utils/utils.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/navigation/navigation.dart';
import 'package:uq_system_app/presentation/pages/auth/reset_password/reset_password_bloc.dart';
import 'package:uq_system_app/presentation/pages/auth/reset_password/reset_password_event.dart';
import 'package:uq_system_app/presentation/pages/auth/reset_password/reset_password_selector.dart';
import 'package:uq_system_app/presentation/pages/auth/reset_password/reset_password_state.dart';
import 'package:uq_system_app/presentation/widgets/alert_dialog.dart';

@RoutePage()
class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final ResetPasswordBloc _bloc = getIt<ResetPasswordBloc>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  String? _errorEmail;
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
        body: ResetPasswordStatusListener(
          listener: (context, state) {
            switch (state.status) {
              case ResetPasswordStatus.loading:
                showDialog(
                    context: context,
                    builder: (context) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: context.colors.secondary,
                        ),
                      );
                    },
                    barrierDismissible: false);
                break;
              case ResetPasswordStatus.success:
                Navigator.pop(context);
                showAlertDialog(
                        context: context, message: 'パスワードをリセットしました。メールを確認してください。')
                    .then(
                        (value) => context.router.replace(const LoginRoute()));
                break;
              case ResetPasswordStatus.failure:
                {
                  Navigator.pop(context);
                  showAlertDialog(
                      context: context,
                      message:
                          Utils.baseExceptionToString(context, state.error));
                }
                break;
              default:
                break;
            }
          },
          statuses: ResetPasswordStatus.values,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(
                  height: 100,
                ),
                AssetGenImage(Assets.images.imgAppLogo.path).image(width: 200),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "パスワード再設定用メール送信",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Hiragino',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "パスワードをお忘れの方は\nご登録いただいているメールアドレスをご入力ください。",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Hiragino',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "再設定手続き用のURLが記載されたメールを送信いたします。",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Hiragino',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              _buildEmailFiled(),
                              if (_errorEmail != null) ...[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      _errorEmail!,
                                      style: TextStyle(
                                          color: context.colors.error,
                                          fontSize: 12),
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          )),
                      const SizedBox(
                        height: 50,
                      ),
                      InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _bloc.add(ResetPasswordEvent.load(
                                (_emailController.text)));
                          }
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
                            color: const Color(0xff4C75AB),
                          ),
                          child: const Center(
                            child: Text(
                              "メールを送信する",
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
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailFiled() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.2,
              blurRadius: 1,
              offset: const Offset(0, 3),
            ),
          ],
          color: const Color(0xffF7F8FA),
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        validator: (value) {
          var errorValue = EmailValidator.validate(value ?? "")
              ? null
              : "正しいメールアドレスを入力してください";
          setState(() {
            _errorEmail = errorValue;
          });
          return errorValue;
        },
        controller: _emailController,
        style: context.appTheme.styles.textStyle,
        decoration: const InputDecoration(
            errorStyle: TextStyle(
              fontSize: 0,
            ),
            fillColor: Color(0xffF7F8FA),
            enabledBorder: InputBorder.none,
            hintStyle: TextStyle(color: Color(0xffA2A2A2)),
            hintText: "ログインID(メールアドレス)",
            border: InputBorder.none),
      ),
    );
  }
}
