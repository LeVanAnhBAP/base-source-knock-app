import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/presentation/pages/dashboard/siteDetails/site_details_bloc.dart';
import 'package:uq_system_app/presentation/pages/dashboard/siteDetails/site_details_event.dart';
import 'package:uq_system_app/presentation/pages/dashboard/siteDetails/site_details_state.dart';

import '../../../../assets.gen.dart';
import '../../../widgets/back_button_app_bar.dart';
import '../../../widgets/content_detail.dart';
import '../../../widgets/title_detail.dart';

@RoutePage()
class SiteDetailsPage extends StatefulWidget {
  final String id;
  final String accessToken;

  const SiteDetailsPage({required this.id, required this.accessToken});

  @override
  State<StatefulWidget> createState() => _SiteDetailsState();
}

class _SiteDetailsState extends State<SiteDetailsPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  late final SiteDetailsBloc _siteDetailsBloc;

  @override
  void initState() {
    _siteDetailsBloc = SiteDetailsBloc();
    _siteDetailsBloc.add(SiteDetailsGetDataStarted(
        accessToken: widget.accessToken, id: widget.id));

    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  String dayFormat(String? dayFrom, String? dayTo) {
    if (dayFrom == 'null' || dayTo == 'null') {
      return 'null';
    } else {
      return '${DateFormat('yyyy/MM/dd(E)').format(DateTime.parse(dayFrom!))} ~ ${DateFormat('yyyy/MM/dd(E)').format(DateTime.parse(dayTo!))}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _siteDetailsBloc,
      child: Scaffold(
        appBar: const BackAppBar(
          title: '現場詳細情報',
        ),
        body: BlocBuilder<SiteDetailsBloc, SiteDetailsState>(
          builder: (context, state) {
            return _buildBody(state);
          },
        ),
      ),
    );
  }

  line() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 0.5,
      color: context.colors.border,
    );
  }

  Widget _buildBody(SiteDetailsState state) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  color: context.colors.background,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(
                    color: context.colors.primary,
                    width: 2,
                  ),
                ),
                child: const Center(
                  child: Text('発注現場'),
                ),
              ),
              const SizedBox(height: 16),
              Flexible(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        height: 40,
                        width: 300,
                        decoration: BoxDecoration(
                            color: context.colors.background,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(24))),
                        child: TabBar(
                          indicator: const BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24))),
                          labelStyle: const TextStyle(color: Colors.white),
                          unselectedLabelStyle:
                              const TextStyle(color: Colors.black),
                          controller: _tabController,
                          tabs: const [
                            Tab(text: '現場詳細'),
                            Tab(text: '画像'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            _buildDetailSiteTab(state),
                            _buildImageTab(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 16,
            left: 36,
            right: 36,
            child: Container(
              height: 60,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius:2,
                      blurRadius: 3,
                      offset: const Offset(0, 0),
                    ),
                  ],
                  color: context.colors.primary,
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: const Center(
                child: Text(
                  '修正画面へ移動',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailSiteTab(SiteDetailsState state) {
    return state.status == SiteDetailsStatus.loading
        ? _buildLoadingWidget()
        : state.status == SiteDetailsStatus.failure
            ? _buildErrorWidget(state.error?.message)
            : _buildDetailSiteContent(state.siteDetail);
  }

  Widget _buildImageTab() {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
      color: context.colors.background,
      child: ListView(
        children: [
          const TitleDetail(text: 'abcdef'),
          SizedBox(
            height: 400,
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 32,
                  crossAxisSpacing: 32,
                  mainAxisExtent: 160,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: context.colors.border,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(32))),
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return const Column(
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Loading...', style: TextStyle(fontSize: 22)),
            SizedBox(width: 20),
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

  Widget _buildErrorWidget(String? errorMessage) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text('Error: $errorMessage'),
      ],
    );
  }

  Widget _buildDetailSiteContent(Map<String, dynamic>? siteDetail) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
      color: Colors.white,
      child: ListView(
        children: [
          const TitleDetail(text: '注文No'),
          ContentDetail(text: (siteDetail?['id'] ?? 'null').toString()),
          line(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleDetail(text: '担当者'),
              Column(
                children: List.generate(4, (index) {
                  return ContentDetail(text: 'acb$index');
                }),
              )
            ],
          ),
          line(),
          const TitleDetail(text: '工事コード'),
          ContentDetail(text: (siteDetail?['code'] ?? 'null').toString()),
          const TitleDetail(text: '工事名'),
          ContentDetail(text: (siteDetail?['name'] ?? 'null').toString()),
          const TitleDetail(text: '工事内容'),
          ContentDetail(
              text: (siteDetail?['content_request'] ?? 'null').toString()),
          line(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TitleDetail(text: '職種'),
              ContentDetail(
                  text: (siteDetail?['factory_floor_occupation'][0]['name'] ??
                          'null')
                      .toString()),
            ],
          ),
          line(),
          const TitleDetail(text: '工期'),
          ContentDetail(
              text: dayFormat(
            (siteDetail?['start_day_request'] ?? 'null').toString(),
            (siteDetail?['end_day_request'] ?? 'null').toString(),
          )),
          line(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TitleDetail(text: '工事場所'),
              button(
                  text: '地図',
                  icon: Assets.icons.svg.icSiteDetailsLocation.path,
                  width: 72)
            ],
          ),
          ContentDetail(
              text: '${(siteDetail?['prefecture_id'] ?? 'null').toString()}, '
                  '${(siteDetail?['city_id'] ?? 'null').toString()}, '
                  '${(siteDetail?['town_id'] ?? 'null').toString()}, '
                  '${(siteDetail?['wards'] ?? 'null').toString()}, '
                  '${(siteDetail?['address'] ?? 'null').toString()}'),
          line(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TitleDetail(text: '注文合計金額'),
              button(
                  text: '注文明細',
                  icon: Assets.icons.svg.icSiteDetailsOrderDetail.path,
                  width: 100)
            ],
          ),
          const ContentDetail(text: '¥33,000'),
          const TitleDetail(text: '備考（記載した内容は注文書に反映されます）'),
          ContentDetail(text: (siteDetail?['remarks'] ?? 'null').toString()),
          const Gap(100)
        ],
      ),
    );
  }

  Widget button(
      {required String text, required String icon, required double width}) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        height: 28,
        width: width,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 0.2,
                blurRadius: 4,
                offset: const Offset(0, 0),
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            color: context.colors.secondary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon),
            const Gap(4),
            Text(
              text,
              style: TextStyle(color: context.colors.background),
            )
          ],
        ),
      ),
    );
  }
}
