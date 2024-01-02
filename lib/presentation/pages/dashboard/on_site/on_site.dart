import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/data/models/response/schedule.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/dashboard/home/widgets/schedule_item.dart';
import 'package:uq_system_app/presentation/pages/dashboard/on_site/on_site_bloc.dart';
import 'package:uq_system_app/presentation/widgets/dashboard_app_bar.dart';

@RoutePage()
class DashBoardOnSitePage extends StatefulWidget {
  @override
  State<DashBoardOnSitePage> createState() => _DashBoardOnSitePageState();
}

class _DashBoardOnSitePageState extends State<DashBoardOnSitePage> {
  final OnSiteBloc _bloc = getIt.get<OnSiteBloc>();

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
        appBar: DashBoardAppBar(
          title: "現場",
          leftIcPath: Assets.icons.svg.icMenu.path,
          rightIcPath: Assets.icons.svg.icDashboardOnsite.path,
          rightIcDescription: "新規登録",
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              _buildSearch(),
              _buildList()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: Row(
          children: [
            SvgPicture.asset(
              Assets.icons.svg.icSearch.path,
              width: 15,
              height: 15,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextField(
                style: context.typographies.subBody2,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  enabledBorder: InputBorder.none,
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  hintText: "現場名検索",
                  hintStyle: context.typographies.subBody2
                      .withColor(context.colors.primary.withOpacity(0.5)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildList() {
    var shedules = <Schedule>[
      const Schedule(
          id: 1,
          title: '千葉県稲毛市クロス貼り替え',
          address: '東京都稲城市東長沼2111',
          startTime: '2023/05/12(金)',
          endTime: '2023/05/18(木)',
          company: '(株)職人インテリア'),
      const Schedule(
          id: 1,
          title: '千葉県稲毛市クロス貼り替え',
          address: '東京都稲城市東長沼2111',
          startTime: '2023/05/12(金)',
          endTime: '2023/05/18(木)',
          company: '(株)職人インテリア'),
      const Schedule(
          id: 1,
          title: '千葉県稲毛市クロス貼り替え',
          address: '東京都稲城市東長沼2111',
          startTime: '2023/05/12(金)',
          endTime: '2023/05/18(木)',
          company: '(株)職人インテリア'),
      const Schedule(
          id: 1,
          title: '千葉県稲毛市クロス貼り替え',
          address: '東京都稲城市東長沼2111',
          startTime: '2023/05/12(金)',
          endTime: '2023/05/18(木)',
          company: '(株)職人インテリア')
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView.builder(
        itemCount: shedules.length,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) => ScheduleItem(
          schedule: shedules[index],
        ),
      ),
    );
  }
}
