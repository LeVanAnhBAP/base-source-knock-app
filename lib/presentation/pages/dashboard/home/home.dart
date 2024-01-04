import 'dart:async';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/navigation/navigation.dart';
import 'package:uq_system_app/presentation/pages/dashboard/home/home_bloc.dart';
import 'package:uq_system_app/presentation/pages/dashboard/home/home_selector.dart';
import 'package:uq_system_app/presentation/pages/dashboard/home/widgets/calendar_view.dart';
import 'package:uq_system_app/presentation/pages/dashboard/home/widgets/schedule_item.dart';
import 'package:uq_system_app/presentation/widgets/dashboard_app_bar.dart';

import 'home_event.dart';
import 'home_state.dart';

@RoutePage()
class DashboardHomePage extends StatefulWidget {
  const DashboardHomePage({super.key});

  @override
  State<DashboardHomePage> createState() => _DashboardHomePageState();
}

class _DashboardHomePageState extends State<DashboardHomePage> {
  final HomeBloc _bloc = getIt.get<HomeBloc>();

  Future _onRefresh() async {
    _bloc.add(const HomeRefreshData());
    return _bloc.stream
        .firstWhere((state) => state.status != HomeStatus.refreshing);
  }

  @override
  void initState() {
    scheduleMicrotask(() {
      _bloc.add(HomeEvent.paginateSite(
          DateTime.now()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        appBar: DashBoardAppBar(
            title: "ホーム",
            leftIcPath: Assets.icons.svg.icMenu.path,
            rightIcPath: Assets.icons.svg.icNotification.path),
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: _buildNotification(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  _buildCalendar(),
                  const SizedBox(
                    height: 30,
                  ),
                  _buildSheduleManager()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNotification() {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, right: 10),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
          decoration: BoxDecoration(
              color: context.colors.tertiary,
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 20,
              ),
              const Text(
                "大事なお知らせ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  context.router.push(const NotificationRoute());
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    size: 30,
                    color: context.appTheme.colors.tertiary,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            child: const Text(
              "2",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCalendar() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: const SizedBox(height: 124, child: CalendarView()),
    );
  }

  Widget _buildSheduleManager() {
    return HomeStatusSelector(
      builder: (status) {
        if (status == HomeStatus.success) {
          var sites = _bloc.state.sites;
          return Column(
            children: [
              Row(
                children: [
                  Text("${_bloc.state.startDayRequest?.month}/${_bloc.state.startDayRequest?.day} の現場",
                      style: TextStyle(
                          color: context.colors.primary,
                          fontSize: 17,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: context.colors.secondary,
                        shape: BoxShape.circle),
                    child: Text(
                      sites.length.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 9),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  GestureDetector(
                    onTap: () {
                      context.router.push(const ScheduleDetailsRoute());
                    },
                    child: Text("スケジュール管理",
                        style: TextStyle(
                            color: context.colors.tertiary,
                            fontSize: 15,
                            fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(
                    width: 40,
                  )
                ],
              ),
              ListView.builder(
                itemCount: sites.length,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) => ScheduleItem(
                  site: sites[index],
                  companyType: _bloc.state.account?.company.type ?? 1,
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
