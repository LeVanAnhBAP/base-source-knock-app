import 'dart:async';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/dashboard/home/home_bloc.dart';
import 'package:uq_system_app/presentation/pages/dashboard/home/home_event.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  late DateTime _firstDay;
  late DateTime _lastDay;
  late StartingDayOfWeek _startingDayOfWeek;
  @override
  void initState() {
    super.initState();
    int currentDayOfWeek = DateTime.now().weekday;
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
    _firstDay = DateTime.utc(1950, 10, 16);
    _lastDay = DateTime.utc(2030, 3, 14);
    _startingDayOfWeek = StartingDayOfWeek.values[currentDayOfWeek - 1];
  }

  void updateShedule(DateTime selectedDay, DateTime focusDay) {
    scheduleMicrotask(() {
      
      getIt.get<HomeBloc>().add(
          HomeEvent.paginateSite(selectedDay));
    });
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        locale: 'ja',
        headerStyle: HeaderStyle(
          leftChevronVisible: false,
          rightChevronVisible: false,
          formatButtonVisible: false,
          titleTextStyle: context.typographies.bodyBold,
        ),
        onPageChanged: (dateTime) {
          updateShedule(dateTime, dateTime);
        },
        rowHeight: 60,
        onDaySelected: (selectedDay, focusedDay) {
          updateShedule(selectedDay, focusedDay);
        },
        calendarStyle: CalendarStyle(
            todayTextStyle: TextStyle(color: context.colors.primary),
            todayDecoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            defaultTextStyle:
                TextStyle(color: context.colors.primary, fontSize: 15),
            selectedDecoration: BoxDecoration(
                color: context.colors.secondary, shape: BoxShape.circle)),
        calendarFormat: CalendarFormat.week,
        startingDayOfWeek: _startingDayOfWeek,
        focusedDay: _focusedDay,
        firstDay: _firstDay,
        lastDay: _lastDay);
  }
}
