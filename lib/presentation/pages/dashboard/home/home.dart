import 'dart:async';
import 'package:dio/dio.dart';
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
import 'package:uq_system_app/presentation/pages/dashboard/notification/notification.dart';
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
  final HomeBloc _bloc = provider.get<HomeBloc>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  final Map<DateTime, List<String>> _events = {
    DateTime(2023, 1, 2): ['Event 1', 'Event 2'],
    DateTime(2023, 1, 5): ['Event 3'],
    DateTime(2023, 1, 10): ['Event 4', 'Event 5'],
  };
  Future _onRefresh() async {
    _bloc.add(const HomeRefreshData());
    return _bloc.stream
        .firstWhere((state) => state.status != HomeStatus.refreshing);
  }

  List listData = [];
  Future<void> loadSite() async {
    if (widget.accessToken != null) {
      print('Access Token: ${widget.accessToken}');
      final dio = Dio();
      dio.options.headers['Authorization'] = 'Bearer ${widget.accessToken}';
      String api =
          "https://dev-knock-api.oneknockapp.com/api/v1/user/factory-floors?page=1&start_day_request=2024-01-06";
      try {
        Response response = await dio.get(api);

        if (response.statusCode == 200) {
          listData = response.data['data']['data'];
        } else {
          print('Failed to load data');
        }
      } catch (e) {
        print('An error occurred: $e');
      }
    } else {
      print('Access token is null');
    }
  }

  @override
  void initState() {
    scheduleMicrotask(() {
      _bloc.add(const DashboardHomeGetDataStarted());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
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
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: Column(
                children: [
                  notificationButton(),
                  futureBuilding(),
                ],
              ),
            ),
          )),
    );
  }

  Widget notificationButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 180,
        margin: const EdgeInsets.symmetric(vertical: 24),
        padding: const EdgeInsets.only(
          top: 8,
          bottom: 8,
          right: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(14)),
          color: context.colors.primary,
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
        daysOfWeekStyle: const DaysOfWeekStyle(
            weekdayStyle: TextStyle(fontSize: 18),
            weekendStyle: TextStyle(fontSize: 18)),
        calendarStyle: CalendarStyle(
          defaultTextStyle: const TextStyle(fontSize: 18),
          weekendTextStyle: const TextStyle(fontSize: 18),
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
          style: const TextStyle(fontSize: 20),
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

  Widget listCard() {
    return Column(
      children: List.generate(listData.length ?? 0, (index) {
        return Column(
          children: [
            ScheduleCard(
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
            ),
            SizedBox(height: index == 1 ? 0 : 16),
          ],
        );
      }),
    );
  }

  Widget futureBuilding() {
    return FutureBuilder<String>(
        future: future(),
        builder: (context, snapshot) {
          Widget widget;
          if (snapshot.hasData) {
            widget = Column(
              children: [
                calendar(),
                const Gap(24),
                title(),
                const Gap(8),
                listCard(),
              ],
            );
          } else {
            if (snapshot.hasError) {
              widget = Text('Error: ${snapshot.error}');
            } else {
              widget = CircularProgressIndicator(
                color: context.colors.primary,
              );
            }
          }
          return widget;
        });
  }

  Future<String> future() async {
    await loadSite();
    return 'abc';
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
