import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uq_system_app/core/extensions/theme.dart';

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

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        locale: 'ja',
        headerVisible: false,
        onPageChanged: (dateTime) {
          setState(() {
            _selectedDay = dateTime;
            _focusedDay = dateTime;
          });
        },
        
        rowHeight: 70,
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
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
