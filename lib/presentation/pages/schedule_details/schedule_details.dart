import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/schedule_details/schedule_details_bloc.dart';
import 'package:uq_system_app/presentation/widgets/base_app_bar.dart';

@RoutePage()
class ScheduleDetailsPage extends StatefulWidget {
  @override
  State<ScheduleDetailsPage> createState() => _ScheduleDetailsPageState();
}

class _ScheduleDetailsPageState extends State<ScheduleDetailsPage> {
  final ScheduleDetailsBloc _bloc = getIt.get<ScheduleDetailsBloc>();
  List<DateTime> selectedDays = [DateTime.utc(2023, 12, 23)];
  List<DateTime> disableDays = [
    DateTime.utc(2023, 12, 24),
    DateTime.utc(2023, 12, 16),
    DateTime.utc(2023, 12, 26),
    DateTime.utc(2023, 12, 27),
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      disableDays = [
        DateTime.utc(2023, 12, 7),
        DateTime.utc(2023, 12, 3),
        DateTime.utc(2023, 12, 4),
        DateTime.utc(2023, 12, 6),
      ];
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
        appBar: CustomAppBar(context,appBarTitle: 'ホーム'),
        body: Column(children: [
          const SizedBox(
            height: 1,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 17),
            color: Colors.white,
            child: Center(
              child: Text(
                'スケジュール詳細',
                style: context.typographies.body,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Stack(
              children: [
                _buildCalendar(),
                Positioned(
                  right: 15,
                  top: 15,
                  child: AssetGenImage(Assets.icons.png.icNote.path)
                      .image(width: 30),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildCalendar() {
    return TableCalendar(
        calendarBuilders: CalendarBuilders(
          weekNumberBuilder: (context, weekNumber) => const SizedBox.shrink(),
        ),
        headerStyle: HeaderStyle(
            leftChevronIcon: Container(
              decoration: BoxDecoration(
                  color: context.colors.primary, shape: BoxShape.circle),
              child: const Icon(
                Icons.chevron_left,
                color: Colors.white,
              ),
            ),
            rightChevronIcon: Container(
              decoration: BoxDecoration(
                  color: context.colors.primary, shape: BoxShape.circle),
              child: const Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
            ),
            leftChevronPadding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 1 / 5),
            rightChevronMargin: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 1 / 5),
            formatButtonVisible: false,
            titleTextStyle: context.typographies.bodyBold,
            titleCentered: true),
        calendarStyle: CalendarStyle(
            disabledDecoration: const BoxDecoration(
                color: Color(0xFF868686), shape: BoxShape.circle),
            outsideDaysVisible: false,
            todayTextStyle: TextStyle(color: context.colors.primary),
            todayDecoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            defaultTextStyle:
                TextStyle(color: context.colors.primary, fontSize: 15),
            selectedDecoration: BoxDecoration(
                color: context.colors.quaternary, shape: BoxShape.circle)),
        selectedDayPredicate: (day) {
          return selectedDays.contains(day);
        },
        enabledDayPredicate: (day) {
          return !disableDays.contains(day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!selectedDays.contains(selectedDay)) {
            setState(() {
              selectedDays.add(selectedDay);
            });
          }
        },
        locale: 'ja',
        focusedDay: DateTime.now(),
        firstDay: DateTime.utc(1950, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14));
  }
}
