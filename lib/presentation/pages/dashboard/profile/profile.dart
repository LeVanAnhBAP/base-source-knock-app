import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/di/injector.dart';
import 'package:uq_system_app/presentation/widgets/app_bar.dart';

import '../../../../assets.gen.dart';
import 'profile_bloc.dart';

@RoutePage()
class DashboardProfilePage extends StatefulWidget {
  @override
  State<DashboardProfilePage> createState() => _DashboardProfilePageState();
}

class _DashboardProfilePageState extends State<DashboardProfilePage>
    with TickerProviderStateMixin {
  final AccountBloc _bloc = provider.get<AccountBloc>();
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
        backgroundColor: context.colors.background,
        appBar: AppBars(
          title: 'マイページ',
          openDrawer: () {},
          rightButtonIcon: '',
          isVisibleDrawer: false,
          isVisibleRightButton: false,
        ),
        body: DefaultTabController(
          length: 2,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: context.colors.background,
                expandedHeight: 320.0,
                floating: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: avatarAndBackground(),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(58),
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
                            horizontal: 60,
                            vertical: 8,
                          ),
                          padding: const EdgeInsets.all(6),
                          height: 40,
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
                                Radius.circular(16),
                              ),
                            ),
                            labelStyle: TextStyle(
                                color: context.colors.background,
                                fontWeight: FontWeight.bold),
                            unselectedLabelStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            controller: _tabController,
                            onTap: (index) {
                              setState(() {
                                _tabController.index = index;
                              });
                            },
                            tabs: const [
                              Tab(
                                text: '本人情報',
                              ),
                              Tab(text: '会社情報'),
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
              SliverFillRemaining(
                child: TabBarView(
                  controller: _tabController,
                  children: const <Widget>[
                    SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          Text('dasd'),
                          Text('dasd'),
                          Text('dasd'),
                          Text('dasd'),
                          Text('dasd'),
                          Text('dasd'),
                          Text('dasd'),
                          Text('dasd'),
                        ],
                      ),
                    ),
                    Center(
                      child: Text('Tab 2 Content'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  avatarAndBackground() {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            Assets.icons.png.profileBackground.path,
            fit: BoxFit.fitWidth,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 120,
            left: MediaQuery.of(context).size.width / 10,
          ),
          child: SizedBox(
            height: 88,
            width: 88,
            child: Stack(
              children: [
                ClipOval(
                  child: Image.asset(Assets.images.avatar.path),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SvgPicture.asset(Assets.icons.svg.icCamera.path),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 200,
            left: MediaQuery.of(context).size.width / 1.2,
          ),
          child: SvgPicture.asset(Assets.icons.svg.icCamera.path),
        ),
      ],
    );
  }
}
