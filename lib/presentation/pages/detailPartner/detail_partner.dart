import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uq_system_app/core/extensions/theme.dart';

import '../../../assets.gen.dart';

@RoutePage()
class DetailPartnerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DetailPartnerState();
}

class DetailPartnerState extends State<DetailPartnerPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: context.colors.background,
              expandedHeight: 360.0,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: _buildAvatarAndBackground(),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(84),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                        height: 36,
                        decoration: BoxDecoration(
                          color: context.colors.divider,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: TabBar(
                          indicator: BoxDecoration(
                            color: context.colors.border,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          labelStyle: TextStyle(
                            color: context.colors.background,
                            fontWeight: FontWeight.bold,
                          ),
                          unselectedLabelStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          controller: _tabController,
                          onTap: (index) {
                            setState(() {
                              _tabController.index = index;
                            });
                          },
                          tabs: const [
                            Tab(
                              text: 'スケジュール',
                            ),
                            Tab(text: '基本情報'),
                            Tab(text: '実績'),
                          ],
                        ),
                      ),
                      Container(
                        color: context.colors.hint,
                        height: 0.5,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return DefaultTabController(
      length: 3,
      child: TabBarView(
        controller: _tabController,
        children: <Widget>[
          _buildScheduleTab(),
          _buildBasicInfoTab(),
          _buildAchievementsTab(),
        ],
      ),
    );
  }

  Widget _buildAvatarAndBackground() {
    return Stack(
      children: [
        Container(
          color: Colors.black54,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Container(
          padding: const EdgeInsets.only(top: 100, left: 16, right: 16),
          child: Column(
            children: [
              Row(
                children: [
                  ClipOval(
                    child: Container(
                      color: Colors.white,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  const Gap(20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'kkhk jhksd',
                        style:
                            TextStyle(fontSize: 16, color: context.colors.text),
                      ),
                      Text(
                        'kkhkjh ksd',
                        style:
                            TextStyle(fontSize: 20, color: context.colors.text),
                      ),
                      Text(
                        'kk hkjhksd',
                        style:
                            TextStyle(fontSize: 24, color: context.colors.text),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            Assets.icons.svg.icPhone.path,
                            height: 40,
                          ),
                          const Gap(8),
                          Text(
                            '023847394',
                            style: TextStyle(
                                fontSize: 22, color: context.colors.text),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              const Gap(20),
              Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(Assets.icons.svg.icRedPin.path,
                          height: 20),
                      const Gap(12),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 260,
                        child: Text(
                          'aasgsd',
                          style: TextStyle(
                              color: context.colors.text, fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      )
                    ],
                  ),
                  const Gap(8),
                  Row(
                    children: [
                      SvgPicture.asset(Assets.icons.svg.icJob.path, height: 20),
                      const Gap(8),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 260,
                        child: Text(
                          'saff sdg dddf',
                          style: TextStyle(
                              color: context.colors.text, fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      )
                    ],
                  ),
                  const Gap(8),
                  Row(
                    children: [
                      SvgPicture.asset(Assets.icons.svg.icEmployees.path,
                          height: 20),
                      const Gap(12),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 260,
                        child: Text(
                          'sdgs df',
                          style: TextStyle(
                              color: context.colors.text, fontSize: 18),
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
    );
  }

  Widget _buildScheduleTab() {
    return Container(
      color: context.colors.disabled,
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: context.colors.background,
          borderRadius: const BorderRadius.all(Radius.circular(20))
        ),
        child: TableCalendar(
          focusedDay: DateTime.now(),
          firstDay: DateTime.utc(2023, 1, 1),
          lastDay: DateTime.utc(2024, 12, 31),
        ),
      ),
    );
  }

  Widget _buildBasicInfoTab() {
    return Container();
  }

  Widget _buildAchievementsTab() {
    return Container();
  }
}
