
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
enum ShowAddress {show,hide}
class _EditCompanyInfoState extends State<EditCompanyInfoPage> {
  ShowAddress? showAddress = ShowAddress.show;
  TextEditingController nameController = TextEditingController();
  TextEditingController furiganaController = TextEditingController();
  TextEditingController bankAccountNumberController = TextEditingController();
  TextEditingController locationMuniController = TextEditingController();
  TextEditingController locationBelowController = TextEditingController();
  TextEditingController buildingsController = TextEditingController();
  TextEditingController telController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController hpUrlController = TextEditingController();
  @override
  void initState() {
    super.initState();
    showAddress = widget.companyInfo['show_address']==1? ShowAddress.show:ShowAddress.hide;
    nameController.text = widget.companyInfo['name'] ?? '';
    furiganaController.text = widget.companyInfo['furigana'] ?? '';
    bankAccountNumberController.text =
        widget.companyInfo['bank_account_number'] ?? '';
    locationMuniController.text =
        widget.companyInfo['location_municipality'] ?? '';
    locationBelowController.text = widget.companyInfo['location_below'] ?? '';
    buildingsController.text= widget.companyInfo['buildings']??'';
    telController.text= widget.companyInfo['tel_number']??'';
    emailController.text =widget.companyInfo['email']??'';
    hpUrlController.text = widget.companyInfo['hp_url']??'';
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
                  ContentDetail(
                      text: 'T${widget.companyInfo['invoice_number']}' ?? ''),
                  const TitleDetail(text: '郵便番号'),
                  Row(
                    children: [
                      Expanded(
                          child: InputField(
                              controller: bankAccountNumberController)),
                      const Gap(4),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side:
                              BorderSide(color: context.colors.backgroundDark),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: Text('検索',
                            style: TextStyle(
                                color: context.colors.backgroundDark)),
                      ),
                      Gap(MediaQuery.of(context).size.width / 3)
                    ],
                  ),
                  const TitleDetail(text: '住所'),
                  InputField(controller: locationMuniController),
                  const TitleDetail(text: '番地以下'),
                  InputField(controller:locationBelowController ),
                  const TitleDetail(text: '建物名等'),
                  InputField(controller: buildingsController),
                  const TitleDetail(text: '住所公開'),
                  checkShowAddress(),
                  const TitleDetail(text: '代表Tel'),
                  InputField(controller: telController),
                  const TitleDetail(text: 'Email'),
                  InputField(controller: emailController),
                  const TitleDetail(text: 'HP URL'),
                  InputField(controller: hpUrlController),
                   const TitleDetail(text: '保有資格'),
                  const Gap(100)
                ],
              ),
            ),
          ),
          saveButton()
        ],
      ),
    );
  }

  saveButton() {
    return Align(
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
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  color: context.colors.primarySwatch),
              child: Center(
                child: Text(
                  '修正',
                  style: TextStyle(color: context.colors.text, fontSize: 24),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  checkShowAddress() {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            title: const Text('公開'),
            leading: Radio<ShowAddress>(
              value: ShowAddress.show,
              groupValue: showAddress,
              onChanged: (ShowAddress? value) {
                setState(() {
                  showAddress = value;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: ListTile(
            title: const Text('非公開'),
            leading: Radio<ShowAddress>(
              value: ShowAddress.hide,
              groupValue: showAddress,
              onChanged: (ShowAddress? value) {
                setState(() {
                  showAddress = value;
                });
              },
            ),
          ),
        ),
          const Gap(80)
      ],

    );
  }
}
