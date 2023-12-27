import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/data/models/response/notification_response.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/notification/notification_bloc.dart';
import 'package:uq_system_app/presentation/pages/notification/widgets/notification_item.dart';
import 'package:uq_system_app/presentation/widgets/base_app_bar.dart';

@RoutePage()
class NotificationPage extends StatefulWidget {
  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final NotificationBloc _bloc = getIt.get<NotificationBloc>();

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
        appBar: CustomAppBar(
          appBarTitle: '大事なお知らせ',
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    var notifications = <NotificationResponse>[
      const NotificationResponse(
          id: 0,
          title: "請求内容確認依頼",
          content: "請求内容確認依頼が届いています。請求内容確認依頼が届いています。請求内容確認依頼が届いています。",
          createAt: 100,
          company: "(株)職人インテリア"),
      const NotificationResponse(
          id: 1,
          title: "受注希望",
          content: "(株)職人インテリア　様から受注希望が届いています。",
          createAt: 100,
          company: "(株)職人インテリア"),
    ];
    return ListView.builder(
        itemCount: notifications.length,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) =>
            NotificationItem(notification: notifications[index]));
  }
}
