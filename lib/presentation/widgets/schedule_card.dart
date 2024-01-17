import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:uq_system_app/core/extensions/theme.dart';

import '../../assets.gen.dart';

enum ScheduleCardStatus { one, two, three, four, five, six, seven }

class ScheduleCard extends StatefulWidget {
  final ScheduleCardStatus status;
  final String scheduleCreator;
  final String title;
  final String location;
  final String dayFrom;
  final String dayTo;
  final String company;
  final String companyLogo;
  final Function() clickDropRight;
  const ScheduleCard(
      {required this.status,
      required this.scheduleCreator,
      required this.title,
      required this.location,
      required this.dayFrom,
      required this.dayTo,
      required this.company,
      required this.companyLogo,
      required this.clickDropRight});
  @override
  State<StatefulWidget> createState() => _ScheduleCardState();
}

class _ScheduleCardState extends State<ScheduleCard> {
  String iconStatus(ScheduleCardStatus status) {
    String icon = Assets.icons.svg.scheduleStatus1.path;
    switch (status) {
      case ScheduleCardStatus.one:
        icon = Assets.icons.svg.scheduleStatus1.path;
        break;
      case ScheduleCardStatus.two:
        icon = Assets.icons.svg.scheduleStatus2.path;
        break;
      case ScheduleCardStatus.three:
        icon = Assets.icons.svg.scheduleStatus3.path;
        break;
      case ScheduleCardStatus.four:
        icon = Assets.icons.svg.scheduleStatus4.path;
        break;
      case ScheduleCardStatus.five:
        icon = Assets.icons.svg.scheduleStatus5.path;
        break;
      case ScheduleCardStatus.six:
        icon = Assets.icons.svg.scheduleStatus6.path;
        break;
      case ScheduleCardStatus.seven:
        icon = Assets.icons.svg.scheduleStatus7.path;
        break;
    }
    return icon;
  }

  String statusContent(ScheduleCardStatus status) {
    String content = 'content';
    switch (status) {
      case ScheduleCardStatus.one:
        content = '未発注';
        break;
      case ScheduleCardStatus.two:
        content = '発注済';
        break;
      case ScheduleCardStatus.three:
        content = '受注希望中';
        break;
      case ScheduleCardStatus.four:
        content = '発注確定/受注確定';
        break;
      case ScheduleCardStatus.five:
        content = '施行中';
        break;
      case ScheduleCardStatus.six:
        content = '検収依頼';
        break;
      case ScheduleCardStatus.seven:
        content = '施行完了';
    }
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [top(), bot()],
    );
  }

  Widget top() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 40,
      decoration: BoxDecoration(
          color: context.colors.information,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                iconStatus(widget.status),
                height: 32,
              ),
              const Gap(4),
              Text(
                statusContent(widget.status),
                style: TextStyle(color: context.colors.background),
              )
            ],
          ),
          Container(
            height: 28,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: context.colors.background),
            child: Center(child: Text(widget.scheduleCreator)),
          )
        ],
      ),
    );
  }

  Widget bot() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      height: 160,
      decoration: BoxDecoration(
          color: context.colors.background,
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(16),
              bottomLeft: Radius.circular(16))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(fontSize: 20),
              ),
              const Gap(20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                            Assets.icons.svg.icScheduleCardLocation.path),
                        const Gap(4),
                        SizedBox(
                          width: MediaQuery.of(context).size.width-112,
                          child: Text(
                            widget.location,
                            style: const TextStyle(fontSize: 13),
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                            Assets.icons.svg.icScheduleCardCalendar.path),
                        const Gap(4),
                        Text(
                          '${DateFormat('yyyy/MM/dd(E)').format(DateTime.parse(widget.dayFrom))} ~ ${DateFormat('yyyy/MM/dd(E)').format(DateTime.parse(widget.dayTo))}',
                          style: const TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(widget.companyLogo),
                        const Gap(8),
                        Text(
                          widget.company,
                          style: const TextStyle(fontSize: 14),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              InkWell(
                onTap: widget.clickDropRight,
                child: SvgPicture.asset(
                  Assets.icons.svg.icScheduleArrowDropright.path,
                  height: 32,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
