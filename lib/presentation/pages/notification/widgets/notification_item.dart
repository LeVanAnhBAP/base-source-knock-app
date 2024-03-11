import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/core/extensions/date_time.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/data/models/response/notification_response.dart';
import 'package:uq_system_app/presentation/navigation/navigation.dart';
import 'package:uq_system_app/presentation/widgets/circle_image_network.dart';

class NotificationItem extends StatelessWidget {
  final NotificationResponse notification;

  const NotificationItem({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      padding: const EdgeInsets.only(left: 15, top: 12, bottom: 12, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: notification.seenFlag == 0
              ? const Color(0xFFDECEF5)
              : const Color(0xFFECF5FE)),
      child: Stack(
        children: [
          Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  notification.title ?? "",
                  style: context.typographies.body,
                ),
                Text(
                  notification.createAt != null
                      ? DateTime.parse(notification.createAt!)
                          .formatTimeDifference()
                      : "",
                  style: context.typographies.subBody2,
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    notification.content ?? "",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: context.typographies.subBody1,
                  ),
                ),
                const SizedBox(
                  width: 40,
                )
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const SizedBox(width: 5),
                if (notification.siteOrder?.workCompany.logo?.url != null) ...[
                  CircleImageNetwork(
                    src: notification.siteOrder!.workCompany.logo!.url!,
                    radius: 30,
                  ),
                ] else ...[
                  AssetGenImage(Assets.images.imgBuildingLogo.path)
                      .image(width: 25)
                ],
                const SizedBox(
                  width: 10,
                ),
                Text(
                  notification.siteOrder?.workCompany.name ?? "",
                  style: context.typographies.subBody2,
                )
              ],
            ),
          ]),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: InkWell(
              onTap: (){
                context.router.push(CompletionReportRoute(notification: notification));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: context.colors.tertiary, shape: BoxShape.circle),
                child: const Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
