import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/di/injector.dart';
import 'package:uq_system_app/presentation/pages/dashboard/profile/profile_bloc.dart';
import 'package:uq_system_app/presentation/pages/dashboard/profile/profile_event.dart';
import 'package:uq_system_app/presentation/pages/dashboard/profile/profile_state.dart';
import 'package:uq_system_app/presentation/widgets/app_bar.dart';
import 'package:uq_system_app/presentation/widgets/content_detail.dart';
import 'package:uq_system_app/presentation/widgets/title_detail.dart';

import '../../../../assets.gen.dart';

@RoutePage()
class DashboardProfilePage extends StatefulWidget {
  final String accessToken;

  const DashboardProfilePage({required this.accessToken});

  @override
  State<DashboardProfilePage> createState() => _DashboardProfilePageState();
}

class _DashboardProfilePageState extends State<DashboardProfilePage>
    with TickerProviderStateMixin {
  final AccountBloc _bloc = AccountBloc();

  late final TabController _tabController;

  @override
  void initState() {
    _bloc.add(AccountGetDataStarted(accessToken: widget.accessToken));
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  String age(String birth) {
    DateTime birthDateTimme = DateTime.parse(birth);
    int ageInt = DateTime.now().year - birthDateTimme.year;
    if (DateTime.now().month < birthDateTimme.month ||
        DateTime.now().month == birthDateTimme.month &&
            DateTime.now().day < birthDateTimme.day) {
      ageInt--;
    }
    return ageInt.toString();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: Scaffold(
        backgroundColor: context.colors.background,
        appBar: AppBars(
          title: 'マイページ',
          openDrawer: () {},
          rightButtonIcon: '',
          isVisibleDrawer: false,
          isVisibleRightButton: false,
        ),
        body: BlocBuilder<AccountBloc, AccountState>(
          builder: (context, state) {
            return DefaultTabController(
              length: 2,
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    backgroundColor: context.colors.background,
                    expandedHeight: 300.0,
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
                      children: <Widget>[
                        _buildPersonalInformation(state),
                        const Center(
                          child: Text('Tab 2 Content'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget avatarAndBackground() {
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

  Widget personalInformationTab(AccountState state) {
    final userInfo = state.userInfo ?? {};
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleDetail(text: 'アカウント種別'),
            const ContentDetail(text: 'aaaaaaaa'),
            const TitleDetail(text: '氏名'),
            ContentDetail(
                text: '${userInfo['first_name']} ${userInfo['last_name']}'),
            const TitleDetail(text: 'ふりがな'),
            ContentDetail(
                text:
                    '${userInfo['first_name_kana']} ${userInfo['last_name_kana']}'),
            const TitleDetail(text: '生年月日'),
            ContentDetail(text: userInfo['date_of_birth'].toString()),
            const TitleDetail(text: '年齢'),
            ContentDetail(text: age(userInfo['date_of_birth'].toString())),
            const TitleDetail(text: 'TEL'),
            ContentDetail(text: userInfo['tel_number'].toString()),
            const TitleDetail(text: 'Email'),
            ContentDetail(text: userInfo['email'].toString()),
            const TitleDetail(text: 'ログインID'),
            ContentDetail(text: userInfo['id'].toString()),
            const TitleDetail(text: 'パスワード'),
            ContentDetail(text: userInfo['password_readable'].toString()),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalInformation(AccountState state) {
    return FutureBuilder<String>(
      future: future(state),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        Widget widget;
        if (snapshot.hasData) {
          widget = personalInformationTab(state);
        } else {
          if (snapshot.hasError) {
            widget = Text('Error: ${snapshot.error}');
          } else {
            widget = Column(
              children: [
                Gap((MediaQuery.of(context).size.height / 2) - 80),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Loading...', style: TextStyle(fontSize: 22)),
                    Gap(20),
                    SizedBox(
                      width: 32,
                      height: 32,
                      child: CircularProgressIndicator(),
                    ),
                  ],
                ),
              ],
            );
          }
        }
        return widget;
      },
    );
  }

  Future<String> future(AccountState state) async {
    if (state.status == AccountStatus.success) {
      return 'abc';
    } else {
      throw Exception('Failed to load data');
    }
  }
}
