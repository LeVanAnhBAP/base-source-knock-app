import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:uq_system_app/presentation/pages/dashboard/widgets/notification_item.dart';
import 'package:uq_system_app/presentation/widgets/back_button_app_bar.dart';
import '../../../../assets.gen.dart';

@RoutePage()
class NotificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackAppBar(
        title: '大事なお知らせ',
        rightButton: SizedBox(),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            top: 12,
            left: 16,
            right: 16,
          ),
          child: Column(
            children: List.generate(5, (index) {
              return NotificationItem(
                title: '請求内容確認依頼',
                content: '請求内容確認依頼が届いています。請求内容確認依頼が届いています。請求内容確認依頼が届いています。',
                time: 'abc',
                companyLogo: Assets.icons.png.icScheduleCardCompanyLogo.path,
                company: '(株)職人インテリア',
              );
            }),
          ),
        ),
      ),
    );
  }
}
