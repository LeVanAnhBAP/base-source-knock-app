import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/data/models/response/partner_response.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/dashboard/search/search_bloc.dart';
import 'package:uq_system_app/presentation/pages/dashboard/search/search_event.dart';
import 'package:uq_system_app/utils/utils.dart';

import '../../../../../core/languages/translation_keys.g.dart';

class SearchItem extends StatefulWidget {
  final PartnerResponse partner;

  const SearchItem({super.key, required this.partner});

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
    var partner = widget.partner;
    return Container(
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                getIt.get<SearchBloc>().add(SearchEvent.changeFavoritePartnerState(id: partner.id));
              },
              child: SvgPicture.asset(
                partner.isFavorite
                    ? Assets.icons.svg.icMarkerSelected.path
                    : Assets.icons.svg.icMarker.path,
                height: 30,
              ),
            ),
          ),
          Row(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            Image.network(
              partner.logo?.url ?? "",
              width: 100,
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                return Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey,
                );
              },
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.04,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    partner.name ?? "",
                    style: context.typographies.body,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    partner.intro ?? context.tr(LocaleKeys.InformationNotEntered),
                    style: context.typographies.subBody1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
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
                          Utils.joinDataWithSeparator(context,
                              partner.workAreas.map((e) => e.name).toList()),
                          style: context.typographies.subBody2,
                          overflow: TextOverflow.ellipsis,
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
                          Utils.joinDataWithSeparator(context,
                              partner.occSubItem.map((e) => e.name).toList()),
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
                          "${context.tr(LocaleKeys.Search_EstimatedNumberOfAvailablePersonnel)}　${partner.manNumber}${context.tr(LocaleKeys.Search_Man)}",
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
    var schedules = widget.partner.schedules.map((e) {
      return DateTime.parse(e.date);
    }).toList();
    return TableCalendar(
        locale: 'ja',
        headerVisible: false,
        selectedDayPredicate: (day) {
          return schedules.any((schedule) {
            return schedule.year == day.year &&
                schedule.month == day.month &&
                schedule.day == day.day;
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
        startingDayOfWeek: StartingDayOfWeek.values[DateTime.now().weekday - 1],
        focusedDay: DateTime.now(),
        firstDay: DateTime.utc(2023, 10, 16),
        lastDay: DateTime.utc(2030, 10, 16));
  }
}
