import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/presentation/widgets/back_button_app_bar.dart';
import 'package:uq_system_app/presentation/widgets/input_field.dart';

import '../../../widgets/content_detail.dart';
import '../../../widgets/title_detail.dart';

@RoutePage()
class EditCompanyInfoPage extends StatefulWidget {
  final Map<String, dynamic> companyInfo;
  const EditCompanyInfoPage({required this.companyInfo});
  @override
  State<StatefulWidget> createState() => _EditCompanyInfoState();
}

class _EditCompanyInfoState extends State<EditCompanyInfoPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController furiganaController = TextEditingController();
  @override
  void initState() {
    super.initState();
    nameController.text = widget.companyInfo['name'] ?? '';
    furiganaController.text = widget.companyInfo['furigana'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackAppBar(title: '会社情報修正', rightButton: SizedBox()),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleDetail(text: '種別'),
                  const ContentDetail(text: 'aaaaaaaa'),
                  const TitleDetail(text: '会社形態'),
                  const ContentDetail(text: 'abc'),
                  const TitleDetail(text: '会社名称/屋号'),
                  InputField(controller: nameController),
                  const TitleDetail(text: 'ふりがな'),
                  InputField(controller: furiganaController),
                  const TitleDetail(text: 'インボイス番号'),
                  ContentDetail(text:widget.companyInfo['invoice_number'] ?? '' ),

                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: const Color.fromRGBO(241, 241, 241, 1),
              child: InkWell(
                onTap: () {},
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: context.colors.secondary,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        color: context.colors.primarySwatch),
                    child: Center(
                      child: Text(
                        '修正',
                        style:
                            TextStyle(color: context.colors.text, fontSize: 24),
                      ),
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
