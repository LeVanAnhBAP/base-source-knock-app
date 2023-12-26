import 'package:auto_route/auto_route.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/core/utils/utils.dart';
import 'package:uq_system_app/data/models/request/login_params.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:uq_system_app/presentation/blocs/auth/auth_event.dart';
import 'package:uq_system_app/presentation/blocs/auth/auth_selector.dart';
import 'package:uq_system_app/presentation/blocs/auth/auth_state.dart';
import 'package:uq_system_app/presentation/navigation/navigation.dart';
import 'package:uq_system_app/presentation/widgets/alert_dialog.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthBloc _bloc = getIt<AuthBloc>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorEmail;
  String? _errorPassword;
  bool isVisiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: AuthListener(
        listener: (context, state) {
          switch (state.authStatus) {
            case AuthStatus.loading:
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
            case AuthStatus.success:
              Navigator.pop(context);
              context.router.replace(const DashboardRoute());
              break;
            case AuthStatus.failure:
              {
                Navigator.pop(context);
                showAlertDialog(
                    context: context,
                    message: Utils.baseExceptionToString(context, state.error));
              }
              break;
            default:
              break;
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    AssetGenImage(Assets.images.imgAppLogo.path)
                        .image(width: 200),
                    const SizedBox(
                      height: 40,
                    ),
                    _buildForm(),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.disabled,
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
                              color: context.colors.error, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(
                    height: 10,
                  ),
                  _buildPassword(),
                  if (_errorPassword != null) ...[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _errorPassword!,
                          style: TextStyle(
                              color: context.colors.error, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ],
              )),
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
            onTap: () {
              if (_formKey.currentState!.validate()) {
                var params = LoginParams(
                    email: _emailController.text,
                    password: _passwordController.text);
                _bloc.add(AuthEvent.login(params));
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

  Widget _buildPassword() {
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
          var errorValue =
              value == null || value.isEmpty ? "パスワードを入力してください" : null;

          setState(() {
            _errorPassword = errorValue;
          });
          return errorValue;
        },
        obscureText: !isVisiblePassword,
        controller: _passwordController,
        style: context.appTheme.styles.textStyle,
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isVisiblePassword = !isVisiblePassword;
                  });
                },
                child: Icon(!isVisiblePassword
                    ? Icons.visibility
                    : Icons.visibility_off)),
            suffixIconColor: context.colors.primary,
            errorStyle: const TextStyle(
              fontSize: 0,
            ),
            fillColor: const Color(0xffF7F8FA),
            enabledBorder: InputBorder.none,
            hintStyle: const TextStyle(color: Color(0xffA2A2A2)),
            hintText: "パスワード",
            border: InputBorder.none),
      ),
    );
  }
}
