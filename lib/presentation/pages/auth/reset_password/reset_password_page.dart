import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/navigation/navigation.dart';
import 'package:uq_system_app/presentation/pages/auth/reset_password/reset_password_bloc.dart';
import 'package:uq_system_app/presentation/pages/auth/reset_password/reset_password_event.dart';
import 'package:uq_system_app/presentation/pages/auth/reset_password/reset_password_selector.dart';
import 'package:uq_system_app/presentation/pages/auth/reset_password/reset_password_state.dart';
import 'package:uq_system_app/presentation/widgets/alert_dialog.dart';

import '../../../../core/languages/translation_keys.g.dart';

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
                        context: context, messages: [context.tr(LocaleKeys.ResetPassword_YourPasswordHasBeenResetPleaseCheckYourEmail)])
                    .then(
                        (value) => context.router.replace(const LoginRoute()));
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
                       Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          context.tr(LocaleKeys.ResetPassword_SendPasswordResetEmail),
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'Hiragino',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                       Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          context.tr(LocaleKeys.ResetPassword_IfYouHaveForgottenYourPasswordPleaseEnterYourRegisteredEmailAddress),
                          style: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'Hiragino',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                       Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          context.tr(LocaleKeys.ResetPassword_WeWillSendYouAnEmailContainingTheURLForTheResettingProcedure),
                          style: const TextStyle(
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
                          child:  Center(
                            child: Text(
                              context.tr(LocaleKeys.ResetPassword_SendAnEmail),
                              style: const TextStyle(
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
              : context.tr(LocaleKeys.ResetPassword_PleaseEnterAValidEmailAddress);
          setState(() {
            _errorEmail = errorValue;
          });
          return errorValue;
        },
        controller: _emailController,
        style: context.appTheme.styles.textStyle,
        decoration:  InputDecoration(
            errorStyle: const TextStyle(
              fontSize: 0,
            ),
            fillColor: const Color(0xffF7F8FA),
            enabledBorder: InputBorder.none,
            hintStyle: const TextStyle(color: Color(0xffA2A2A2)),
            hintText: context.tr(LocaleKeys.ResetPassword_LoginIDEmailAddress),
            border: InputBorder.none),
      ),
    );
  }
}
