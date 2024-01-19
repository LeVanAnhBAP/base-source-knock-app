import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:uq_system_app/presentation/pages/dashboard/profile/profile_bloc.dart';
import 'package:uq_system_app/presentation/pages/dashboard/profile/profile_event.dart';
import 'package:uq_system_app/presentation/pages/dashboard/profile/profile_state.dart';
import 'package:uq_system_app/presentation/widgets/app_bar.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/presentation/widgets/content_detail.dart';
import 'package:uq_system_app/presentation/widgets/title_detail.dart';
import 'package:uq_system_app/assets.gen.dart';

@RoutePage()
class DashboardProfilePage extends StatefulWidget {
  final String accessToken;

  const DashboardProfilePage({required this.accessToken});

  @override
  State<DashboardProfilePage> createState() => _DashboardProfilePageState();
}

class _DashboardProfilePageState extends State<DashboardProfilePage> with TickerProviderStateMixin {
  late final AccountBloc _bloc;
  late final TabController _tabController;

  @override
  void initState() {
    _bloc = AccountBloc()..add(AccountGetDataStarted(accessToken: widget.accessToken));
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  String age(String birth) {
    DateTime birthDateTime = DateTime.parse(birth);
    int ageInt = DateTime.now().year - birthDateTime.year;
    if (DateTime.now().month < birthDateTime.month ||
        (DateTime.now().month == birthDateTime.month && DateTime.now().day < birthDateTime.day)) {
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
                        _buildPersonalInformationTab(state),
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

  Widget _buildPersonalInformationTab(AccountState state) {
    if (state.status == AccountStatus.loading) {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 32,
            height: 32,
            child: CircularProgressIndicator(),
          ),
        ],
      );
    } else if (state.status == AccountStatus.success) {
      return personalInformationTab(state);
    } else {
      // Handle error state
      return Center(
        child: Text('Error: ${state.error?.message ?? "Unknown error"}'),
      );
    }
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
              text: '${userInfo['first_name']} ${userInfo['last_name']}',
            ),
            const TitleDetail(text: 'ふりがな'),
            ContentDetail(
              text: '${userInfo['first_name_kana']} ${userInfo['last_name_kana']}',
            ),
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
}
