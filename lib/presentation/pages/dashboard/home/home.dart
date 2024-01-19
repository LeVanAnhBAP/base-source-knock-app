import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/di/injector.dart';
import 'package:uq_system_app/presentation/navigation/navigation.dart';
import 'package:uq_system_app/presentation/pages/dashboard/home/home_bloc.dart';
import 'package:uq_system_app/presentation/widgets/schedule_card.dart';
import '../../../../assets.gen.dart';
import '../../../../core/themes/colors.dart';
import '../../../widgets/app_bar.dart';
import 'home_event.dart';
import 'home_state.dart';

@RoutePage()
class DashboardHomePage extends StatefulWidget {
  final String accessToken;
  const DashboardHomePage({super.key, required this.accessToken});

  @override
  State<DashboardHomePage> createState() => _DashboardHomePageState();
}

class _DashboardHomePageState extends State<DashboardHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  final Map<DateTime, List<String>> _events = {
    DateTime(2023, 1, 2): ['Event 1', 'Event 2'],
    DateTime(2023, 1, 5): ['Event 3'],
    DateTime(2023, 1, 10): ['Event 4', 'Event 5'],
  };
  Future _onRefresh() async {
    homeBloc.add(const HomeRefreshData());
    return homeBloc.stream
        .firstWhere((state) => state.status != HomeStatus.refreshing);
  }

  late HomeBloc homeBloc;

  @override
  void initState() {
    super.initState();
    homeBloc = context.read<HomeBloc>();
    scheduleMicrotask(() {
      homeBloc
          .add(DashboardHomeGetDataStarted(accessToken: widget.accessToken));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeBloc,
      child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBars(
            title: 'ホーム',
            openDrawer: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            rightButtonIcon: Assets.icons.svg.icFeatherBell.path,
          ),
          drawer: Drawer(
            child: ListView(
              children: const [
                Text('avdvfvd'),
                Text('avdvfvd'),
                Text('avdvfvd'),
                Text('avdvfvd'),
              ],
            ),
          ),
          body: Container(
              margin: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: Center(
                child: blocBuilding(),
              ))),
    );
  }

  Widget notificationButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 180,
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.only(
          top: 8,
          bottom: 8,
          right: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(14)),
          color: context.read<HomeBloc>().state.status == HomeStatus.success
              ? context.colors.primary
              : Colors.grey,
        ),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  '大事なお知らせ',
                  style:
                      TextStyle(fontSize: 16, color: context.colors.background),
                ),
              ),
            ),
            InkWell(
                onTap: () {
                  context.router.push(const NotificationRoute());
                },
                child: SvgPicture.asset(
                    Assets.icons.svg.icArrowDroprightCircle.path))
          ],
        ),
      ),
    );
  }

  Widget calendar() {
    return Container(
      height: 180,
      decoration: BoxDecoration(
          color: context.colors.background,
          borderRadius: BorderRadius.circular(16)),
      child: TableCalendar(
        firstDay: DateTime.utc(2023, 1, 1),
        lastDay: DateTime.utc(2024, 12, 31),
        focusedDay: _focusedDay,
        calendarFormat: CalendarFormat.week,
        eventLoader: (date) => _events[date] ?? [],
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
          todayDecoration: BoxDecoration(
            color: context.colors.secondary,
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.black),
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
        rowHeight: 80,
        headerStyle: const HeaderStyle(
          titleTextStyle: TextStyle(fontSize: 20),
          headerMargin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          leftChevronVisible: false,
          rightChevronVisible: false,
          formatButtonVisible: false,
        ),
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            print(_selectedDay);
          });
        },
      ),
    );
  }

  Widget title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${DateFormat('M/dd', 'ja_JP').format(_selectedDay)} の現場',
          style: context.typographies.body,
        ),
        Row(
          children: [
            Text(
              'スケジュール管理',
              style: TextStyle(color: context.colors.primary, fontSize: 20),
            ),
            const Gap(20)
          ],
        ),
      ],
    );
  }

  Widget listCard({required List<dynamic> listData}) {
    return Expanded(
      child: ListView.builder(
          itemCount: listData.length,
          itemBuilder: (context, index) {
            return ScheduleCard(
              title: listData[index]['name'] ?? 'null',
              location: listData[index]['address'] ?? 'null',
              dayFrom: listData[index]['start_day_request'],
              dayTo: listData[index]['end_day_request'],
              company: listData[index]['company_name_kana'],
              companyLogo: Assets.icons.png.icScheduleCardCompanyLogo.path,
              clickDropRight: () {
                if (listData[index]['status'].toString() == '0') {
                  context.router.push(const CreateSiteRoute());
                } else {
                  context.router.push(const SiteDetailsRoute());
                }
              },
              status: statusCheck(listData[index]['status'].toString()),
              scheduleCreator:
                  '${listData[index]['first_name']} ${listData[index]['last_name']}',
            );
          }),
    );
  }

  Widget blocBuilding() {
    return Builder(
      builder: (context) => BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStatus.loading) {
            return CircularProgressIndicator(
              color: context.colors.primary,
            );
          } else {
            return Column(
              children: [
                notificationButton(),
                calendar(),
                const SizedBox(height: 24),
                title(),
                const SizedBox(height: 8),
                listCard(listData: state.listData ?? []),
              ],
            );
          }
        },
      ),
    );
  }

  ScheduleCardStatus statusCheck(String statusData) {
    ScheduleCardStatus statusCheck = ScheduleCardStatus.seven;
    switch (statusData) {
      case '0':
        statusCheck = ScheduleCardStatus.one;
        break;
      case '1':
        statusCheck = ScheduleCardStatus.one;
        break;
      case '2':
        statusCheck = ScheduleCardStatus.two;
        break;
      case '3':
        statusCheck = ScheduleCardStatus.three;
        break;
      case '4':
        statusCheck = ScheduleCardStatus.four;
        break;
      case '5':
        statusCheck = ScheduleCardStatus.five;
        break;
      case '6':
        statusCheck = ScheduleCardStatus.six;
        break;
      case '7':
        statusCheck = ScheduleCardStatus.seven;
        break;
    }
    return statusCheck;
  }
}
