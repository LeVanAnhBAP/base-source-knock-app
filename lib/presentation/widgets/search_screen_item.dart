import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uq_system_app/core/extensions/theme.dart';

import '../../assets.gen.dart';

class SearchScreenItem extends StatefulWidget {
  final String? logo;
  final String introduction;
  final String companyName;
  final String location;
  final String occupation;
  final String manNumber;
  final Function() onClick;

  const SearchScreenItem({
    required this.logo,
    required this.companyName,
    required this.introduction,
    required this.location,
    required this.occupation,
    required this.manNumber,
    required this.onClick
  });
  @override
  State<StatefulWidget> createState() => _SearchScreenItemState();
}

class _SearchScreenItemState extends State<SearchScreenItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        item(),
        const Gap(2),
        calendar(),
      ],
    );
  }

  calendar() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: context.colors.background,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: TableCalendar(
        firstDay: DateTime.utc(2023, 1, 1),
        lastDay: DateTime.utc(2024, 12, 31),
        focusedDay: DateTime.now(),
        calendarFormat: CalendarFormat.week,
        startingDayOfWeek: StartingDayOfWeek.monday,
        availableGestures: AvailableGestures.horizontalSwipe,
        daysOfWeekHeight: 30,
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: context.typographies.body,
          weekendStyle: context.typographies.body,
        ),
        calendarStyle: CalendarStyle(
          defaultTextStyle: context.typographies.body,
          weekendTextStyle: context.typographies.body,
          todayDecoration: BoxDecoration(color: context.colors.background),
          todayTextStyle: context.typographies.body,
          selectedDecoration: BoxDecoration(
            color: context.colors.secondary,
            shape: BoxShape.circle,
          ),
        ),
        rowHeight: 40,
        headerVisible: false,
      ),
    );
  }

  item() {
    return InkWell(
      onTap: widget.onClick,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 180,
        decoration: BoxDecoration(color: context.colors.background),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 160,
                  width: 160,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: widget.logo == null
                      ? const Center(child: Text('null'))
                      : Image.network(
                          widget.logo!,
                          fit: BoxFit.scaleDown,
                        ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 260,
                        child: Text(
                          widget.companyName,
                          style: context.typographies.body,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      SvgPicture.asset(Assets.icons.svg.icMark.path)
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 260,
                    child: Text(
                      widget.introduction,
                      style: context.typographies.caption2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(Assets.icons.svg.icRedPin.path),
                          const Gap(4),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 260,
                            child: Text(
                              widget.location,
                              style: context.typographies.caption2,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          )
                        ],
                      ),
                      const Gap(8),
                      Row(
                        children: [
                          SvgPicture.asset(Assets.icons.svg.icJob.path),
                          const Gap(4),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 260,
                            child: Text(
                              widget.occupation,
                              style: context.typographies.caption2,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          )
                        ],
                      ),
                      const Gap(8),
                      Row(
                        children: [
                          SvgPicture.asset(Assets.icons.svg.icEmployees.path),
                          const Gap(4),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 260,
                            child: Text(
                              widget.manNumber,
                              style: context.typographies.caption2,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
