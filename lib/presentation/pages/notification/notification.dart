import 'dart:async';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/data/models/response/notification_response.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/notification/notification_bloc.dart';
import 'package:uq_system_app/presentation/pages/notification/notification_event.dart';
import 'package:uq_system_app/presentation/pages/notification/notification_selector.dart';
import 'package:uq_system_app/presentation/pages/notification/notification_state.dart';
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
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      _bloc.add(const NotificationEvent.onLoad());
    });
  }
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
          context,
          appBarTitle: '大事なお知らせ',
        ),
        body: NotificationSelector(
            selector: (state) => state.status,
          builder: (data) {
            if(data == NotificationStatus.success) return _buildBody();
            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildBody() {
    var notifications = _bloc.state.notifications;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
          itemCount: notifications.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) =>
              NotificationItem(notification: notifications[index])),
    );
  }
}
