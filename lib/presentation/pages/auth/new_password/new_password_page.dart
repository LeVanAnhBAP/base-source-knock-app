


import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/presentation/widgets/main_text_field.dart';

@RoutePage()
class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          const SizedBox(
            height: 40,
          ),
          AssetGenImage(Assets.images.imgAppLogo.path).image(width: 200),
          const SizedBox(
            height: 40,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child:  Column(
              children: [
                const Text(
                  "パスワード再設定",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Hiragino',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "※8文字以上の半角英数記号で設定できます。",
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Hiragino',
                    fontWeight: FontWeight.w300,
                    color: Color(0xffE54827),
                  ),
                ),
                
                const SizedBox(
                  height: 30,
                ),
                const MainTextField(
                  hintText: "新しいパスワード",
                ),
                const SizedBox(
                  height: 30,
                ),
                 const MainTextField(
                  hintText: "新しいパスワード（確認用）",
                ),
                const SizedBox(
                  height: 50,
                ),
                  InkWell(
            
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.2,
                    blurRadius: 1,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff4C75AB),
              ),
              child: const Center(
                child: Text(
                  "パスワードを再設定する",
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
    ));
  }
}