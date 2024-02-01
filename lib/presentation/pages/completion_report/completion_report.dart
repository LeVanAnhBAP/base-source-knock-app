import 'dart:async';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/data/models/response/notification_response.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/completion_report/completion_report_bloc.dart';
import 'package:uq_system_app/presentation/pages/completion_report/completion_report_event.dart';
import 'package:uq_system_app/presentation/widgets/base_app_bar.dart';
import 'package:uq_system_app/presentation/widgets/divider_line.dart';

@RoutePage()
class CompletionReportPage extends StatefulWidget {
  final NotificationResponse notification;

  const CompletionReportPage(this.notification);

  @override
  State<CompletionReportPage> createState() => _CompletionReportPageState();
}

class _CompletionReportPageState extends State<CompletionReportPage> {
  final CompletionReportBloc _bloc = getIt.get<CompletionReportBloc>();

  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      // _bloc.add(CompletionReportEvent.loadImages(filePaths: widget.notification.));
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
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          context,
          titleText: "完了報告",
        ),
        body: Column(
          children: [
            const DividerLine(),
            const SizedBox(
              height: 30,
            ),
            Text(
              widget.notification.content ?? "",
              style: context.typographies.bodyBold,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                          color: context.colors.secondary,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            Assets.icons.svg.icDashboardOnsite.path,
                            colorFilter: const ColorFilter.mode(
                                Colors.white, BlendMode.srcIn),
                          ),
                          Text(
                            "現場情報",
                            style: context.typographies.subBody2
                                .withColor(Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const DividerLine(),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "工事名",
                    style: context.typographies.bodyBold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      widget.notification.site?.name ?? "",
                      style: context.typographies.subBody1
                          .withColor(context.colors.primary),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const DividerLine(),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "完了報告",
                    style: context.typographies.bodyBold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      widget.notification.siteOrder?.message ?? "",
                      style: context.typographies.subBody1
                          .withColor(context.colors.primary),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
