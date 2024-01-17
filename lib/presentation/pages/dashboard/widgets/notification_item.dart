import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../assets.gen.dart';

class NotificationItem extends StatelessWidget {
  final String title;
  final String content;
  final String time;
  final String companyLogo;
  final String company;
  const NotificationItem(
      {required this.title,
      required this.content,
      required this.time,
      required this.companyLogo,
      required this.company});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
          color: Color.fromRGBO(236, 245, 254, 1),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                time,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    content,
                    style: const TextStyle(fontSize: 16),
                    softWrap: true,
                  ),
                ),
                InkWell(
                  child: SvgPicture.asset(
                      Assets.icons.svg.icScheduleArrowDropright.path),
                  onTap: () {},
                )
              ],
            ),
          ),
          Row(
            children: [
              Image.asset(companyLogo),
              const Gap(8),
              Text(
                company,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          )
        ],
      ),
    );
  }
}
