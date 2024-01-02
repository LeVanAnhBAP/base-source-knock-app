import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/data/models/response/woker.dart';

class SearchItem extends StatefulWidget {
  final Worker worker;
  const SearchItem({super.key, required this.worker});

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  late DateTime _selectedDay;
  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            )),
        child: Column(
          children: [
            _buildInfo(context),
            Divider(
              height: 1,
              color: context.colors.divider,
            ),
            _buildCalendar(context)
          ],
        ));
  }

  Widget _buildInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          if (widget.worker.isDone) ...[
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: context.colors.tertiary,
                    borderRadius: BorderRadiusDirectional.circular(10)),
                padding: const EdgeInsets.only(
                    right: 13, top: 5, left: 23, bottom: 7),
                child: Text(
                  "Knock済み",
                  style: context.typographies.subBody1
                      .withColor(Colors.white)
                      .withWeight(FontWeight.w600),
                ),
              ),
            )
          ],
          if (widget.worker.isDone) ...[
            Positioned(
                top: 0,
                right: 0,
                child: SvgPicture.asset(
                  Assets.icons.svg.icMarker.path,
                  height: 30,
                ))
          ] else
            Positioned(
                top: 0,
                right: 0,
                child: SvgPicture.asset(
                  Assets.icons.svg.icMarkerSelected.path,
                  height: 30,
                )),
          Row(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            Column(
              children: [
                if (widget.worker.isDone) ...[
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: context.colors.primary)),
                    child: AssetGenImage(
                      Assets.images.imgWoker1.path,
                    ).image(height: 120),
                  )
                ] else
                  AssetGenImage(
                    Assets.images.imgWoker2.path,
                  ).image(height: 120),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.04,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.worker.title,
                    style: context.typographies.body,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.worker.content,
                    style: context.typographies.subBody1,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(Assets.icons.svg.icLocation.path,
                          height: 16,
                          colorFilter: const ColorFilter.mode(
                              Colors.red, BlendMode.srcIn)),
                      const SizedBox(
                        width: 7.8,
                      ),
                      Expanded(
                        child: Text(
                          widget.worker.address,
                          style: context.typographies.subBody2,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.icons.svg.icWrench.path,
                        height: 16,
                      ),
                      const SizedBox(
                        width: 5.8,
                      ),
                      Expanded(
                        child: Text(
                          widget.worker.job,
                          style: context.typographies.subBody2,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        Assets.icons.svg.icPersonal.path,
                        height: 16,
                      ),
                      const SizedBox(
                        width: 5.3,
                      ),
                      Expanded(
                        child: Text(
                          "稼働可能人員目安　${widget.worker.amount}人",
                          style: context.typographies.subBody2,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 7,
            )
          ]),
        ],
      ),
    );
  }

  Widget _buildCalendar(BuildContext context) {
    return TableCalendar(
        locale: 'ja',
        headerVisible: false,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
          });
        },
        rowHeight: 50,
        calendarStyle: CalendarStyle(
            todayTextStyle: TextStyle(color: context.colors.primary),
            todayDecoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            defaultTextStyle:
                TextStyle(color: context.colors.primary, fontSize: 15),
            selectedDecoration: BoxDecoration(
                color: context.colors.quaternary, shape: BoxShape.circle)),
        calendarFormat: CalendarFormat.week,
        startingDayOfWeek: StartingDayOfWeek.values[DateTime.now().weekday - 2],
        focusedDay: DateTime.now(),
        firstDay: DateTime.now().subtract(const Duration(days: 3)),
        lastDay: DateTime.now().add(const Duration(days: 3)));
  }
}
