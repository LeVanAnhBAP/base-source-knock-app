import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/presentation/navigation/navigation.dart';
import 'package:uq_system_app/presentation/pages/dashboard/profile/profile_bloc.dart';
import 'package:uq_system_app/presentation/pages/dashboard/profile/profile_event.dart';
import 'package:uq_system_app/presentation/pages/dashboard/profile/profile_state.dart';
import 'package:uq_system_app/presentation/widgets/app_bar.dart';
import 'package:uq_system_app/presentation/widgets/content_detail.dart';
import 'package:uq_system_app/presentation/widgets/title_detail.dart';

import '../../../../data/services/auth/auth.services.dart';

@RoutePage()
class DashboardProfilePage extends StatefulWidget {
  const DashboardProfilePage({Key? key}) : super(key: key);

  @override
  State<DashboardProfilePage> createState() => _DashboardProfilePageState();
}

class _DashboardProfilePageState extends State<DashboardProfilePage>
    with TickerProviderStateMixin {
  late final AccountBloc _bloc;
  late final TabController _tabController;

  @override
  void initState() {
    _bloc = AccountBloc()
      ..add(const AccountGetDataStarted());
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
        (DateTime.now().month == birthDateTime.month &&
            DateTime.now().day < birthDateTime.day)) {
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
            return _buildNestedScrollView(state);
          },
        ),
      ),
    );
  }

  Widget _buildNestedScrollView(AccountState state) {
    if (state.status == AccountStatus.loading) {
      return const Center(
        child: SizedBox(
          width: 32,
          height: 32,
          child: CircularProgressIndicator(),
        ),
      );
    } else if (state.status == AccountStatus.success) {
      return NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: context.colors.background,
              expandedHeight: 300.0,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: _buildAvatarAndBackground(state),
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
          ];
        },
        body: _buildBody(state),
      );
    } else {
      return Center(
        child: Text('Error: ${state.error?.message ?? "Unknown error"}'),
      );
    }
  }

  Widget _buildBody(AccountState state) {
    return DefaultTabController(
      length: 2,
      child: TabBarView(
        controller: _tabController,
        children: <Widget>[
          _buildPersonalInformationTab(state),
          _buildCompanyInformationTab(state),
        ],
      ),
    );
  }

  Widget _buildAvatarAndBackground(AccountState state) {
    final userInfo = state.userInfo ?? {};
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Image.network(
            userInfo['company']['background']['url'],
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
                  child: Image.network(userInfo['avatar']['url']),
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
    final userInfo = state.userInfo ?? {};
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          const TitleDetail(text: 'アカウント種別'),
          const ContentDetail(text: 'aaaaaaaa'),
          const TitleDetail(text: '氏名'),
          ContentDetail(
            text: '${userInfo['first_name']} ${userInfo['last_name']}',
          ),
          const TitleDetail(text: 'ふりがな'),
          ContentDetail(
            text:
                '${userInfo['first_name_kana']} ${userInfo['last_name_kana']}',
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
          const Gap(20),
        ],
      ),
    );
  }

  Widget _buildCompanyInformationTab(AccountState state) {
    final Map<String, dynamic> companyInfo = state.userInfo!['company'] ?? {};
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TitleDetail(text: '種別'),
              IconButton(
                  onPressed: (){
                       context.router.push(const EditCompanyInfoRoute());
                  },
                  icon: SvgPicture.asset(Assets.icons.svg.icEditCompanyInfo.path))
            ],
          ),
          const ContentDetail(text: 'aaaaaaaa'),
          const TitleDetail(text: '会社形態'),
          const ContentDetail(
            text: 'abc',
          ),
          const TitleDetail(text: '会社名称/屋号'),
          ContentDetail(
            text: companyInfo['name'],
          ),
          const TitleDetail(text: 'ふりがな'),
          ContentDetail(text: companyInfo['furigana']),
          const TitleDetail(text: 'インボイス番号'),
          ContentDetail(text: 'T${companyInfo['invoice_number']}'),
          const TitleDetail(text: '郵便番号'),
          ContentDetail(text: companyInfo['postal_code']),
          const TitleDetail(text: '住所'),
          ContentDetail(text: companyInfo['location_municipality']),
          const TitleDetail(text: '番地以下'),
          ContentDetail(text: companyInfo['location_below']),
          const TitleDetail(text: '建物名等'),
          ContentDetail(text: companyInfo['buildings']),
          const TitleDetail(text: '住所公開'),
          ContentDetail(text: companyInfo['show_address'].toString()),
          const TitleDetail(text: '代表Tel'),
          ContentDetail(text: companyInfo['tel_number']),
          const TitleDetail(text: 'Email'),
          ContentDetail(text: companyInfo['email']),
          const TitleDetail(text: 'HP URL'),
          ContentDetail(text: companyInfo['hp_url']),
          line(),
          rowContent(
              title: '保有資格',
              content: '${companyInfo['certificate'][0]}, '
                  '${companyInfo['certificate'][1]}, '
                  '${companyInfo['certificate'][2]}',
              isAlignRight: true),
          line(),
          rowContent(
            title: '対応エリア',
            content: '${companyInfo['work_areas'][0]['name']}, '
                '${companyInfo['work_areas'][1]['name']}, '
                '${companyInfo['work_areas'][2]['name']}, '
                '${companyInfo['work_areas'][3]['name']}',
            isAlignRight: true,
          ),
          line(),
          rowContent(
              title: '職種',
              content: companyInfo['occupation_sub_item'][0]['name'],
              isAlignRight: true),
          line(),
          const TitleDetail(text: '労災保険'),
          ContentDetail(
              text: companyInfo['fire_insurance'] == 1 ? '加入している' : '加入していない'),
          const TitleDetail(text: '社会保険'),
          ContentDetail(
              text:
                  companyInfo['social_insurance'] == 1 ? '加入している' : '加入していない'),
          const TitleDetail(text: 'その他の保険'),
          ContentDetail(text: companyInfo['other_insurance']['name']),
          line(),
          rowContent(title: '履歴事項全部証明書', content: '', isAlignRight: true),
          line(),
          rowContent(title: '建設業許可証明書', content: '', isAlignRight: true),
          line(),
          const TitleDetail(text: 'ひとこと紹介'),
          ContentDetail(text: companyInfo['intro']),
          const TitleDetail(text: '自己紹介'),
          ContentDetail(text: companyInfo['self_intro']),
          const TitleDetail(text: '稼働可能人数'),
          ContentDetail(text: '${companyInfo['man_number']}人'),
          line(),
          const TitleDetail(text: '会計期間'),
          rowContent(
              title: '開始日',
              content:
                  ' ${companyInfo['start_period_month']}月${companyInfo['start_period_day']}日',
              isAlignRight: false),
          rowContent(
              title: '終了日',
              content:
                  '${companyInfo['end_period_month']}月${companyInfo['end_period_day']}日',
              isAlignRight: false),
          line(),
          const TitleDetail(text: '締め日'),
          ContentDetail(text: companyInfo['deadline_day'].toString()),
          const TitleDetail(text: '支払日'),
          ContentDetail(text: '${companyInfo['payment_latter_month']}ヶ月後の月末日'),
          line(),
          const TitleDetail(text: '口座情報'),
          rowContent(
              title: '金融機関名',
              content: companyInfo['bank_name'],
              isAlignRight: false),
          rowContent(
              title: '支店名',
              content: companyInfo['bank_branch_name'],
              isAlignRight: false),
          rowContent(
              title: '口座種別',
              content: companyInfo['bank_account_type'].toString(),
              isAlignRight: false),
          rowContent(
              title: '口座番号',
              content: companyInfo['bank_account_number'].toString(),
              isAlignRight: false),
          rowContent(
              title: '口座名義',
              content: companyInfo['bank_account_name'],
              isAlignRight: false),
          line(),
          const Gap(20),
        ],
      ),
    );
  }

  line() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 0.3,
      color: context.colors.border,
    );
  }

  rowContent(
      {required String title,
      required String content,
      required bool isAlignRight}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TitleDetail(text: title),
        SizedBox(
          width: MediaQuery.of(context).size.width - 200,
          child: Align(
            alignment: isAlignRight == true
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Text(content, maxLines: 1, overflow: TextOverflow.ellipsis),
          ),
        )
      ],
    );
  }
}
