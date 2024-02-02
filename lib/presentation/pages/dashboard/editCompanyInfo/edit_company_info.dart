import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/presentation/widgets/back_button_app_bar.dart';

import '../../../widgets/title_detail.dart';
@RoutePage()
class EditCompanyInfoPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_EditCompanyInfoState();
  
}
class _EditCompanyInfoState extends State<EditCompanyInfoPage>{
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: const BackAppBar(title: '会社情報修正', rightButton: SizedBox()),
      body: Stack(
        children: [
           SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 16,left: 16,right: 16 ),
              child: const Column(
                children: [
                  TitleDetail(text: '種別'),

                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: const Color.fromRGBO(241, 241, 241, 1),
              child:  InkWell(
                onTap: (){},
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: context.colors.secondary,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                    height: 60,
                    decoration:  BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      color: context.colors.primarySwatch
                    ),
                    child:  Center(
                      child: Text('修正',style: TextStyle(color: context.colors.text,fontSize: 24),),
                    ),
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