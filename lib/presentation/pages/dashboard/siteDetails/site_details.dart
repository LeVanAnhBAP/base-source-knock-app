import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
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
import '../../../../data/services/auth/auth.services.dart';
import '../../../navigation/navigation.dart';
import '../../../widgets/back_button_app_bar.dart';
import '../../../widgets/content_detail.dart';
import '../../../widgets/title_detail.dart';

@RoutePage()
class SiteDetailsPage extends StatefulWidget {
  final String id;

  const SiteDetailsPage({required this.id});

  @override
  State<StatefulWidget> createState() => _SiteDetailsState();
}

class _SiteDetailsState extends State<SiteDetailsPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  late final SiteDetailsBloc _siteDetailsBloc;
  Map<String, dynamic>? _currentSiteDetail;
  @override
  void initState() {
    _siteDetailsBloc = SiteDetailsBloc();
    _siteDetailsBloc.add(SiteDetailsGetDataStarted( id: widget.id));

    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  String dayFormat(String? dayFrom, String? dayTo) {
    if (dayFrom == 'null' || dayTo == 'null') {
      return 'null';
    } else {
      return '${DateFormat('yyyy/MM/dd(E)').format(DateTime.parse(dayFrom!))} ~'
          ' ${DateFormat('yyyy/MM/dd(E)').format(DateTime.parse(dayTo!))}';
    }
  }

  String convertOrderNumber(String? orderNumber) {
    if (orderNumber == null) {
      return '00000';
    } else {
      String numString = orderNumber.toString();
      return numString.length >= 5
          ? numString
          : '0' * (5 - numString.length) + numString;
    }
  }

  String convertPrice(int? price) {
    if (price == null) {
      return 'null';
    } else {
      final format = NumberFormat("#,###");
      return '¥${format.format(price).toString()}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _siteDetailsBloc,
      child: Scaffold(
        appBar: BackAppBar(
          title: '現場詳細情報',
          rightButton: IconButton(
              onPressed: () {
                _showBottomSheet();
              },
              icon: SvgPicture.asset(Assets.icons.svg.icSiteDetailMenu.path)),
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
      height: 0.3,
      color: context.colors.border,
    );
  }

  Widget _buildBody(SiteDetailsState state) {
    _currentSiteDetail = state.siteDetail;
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
          editButton(),
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

  Widget _buildDetailSiteContent(Map<String, dynamic>? siteDetail) {
    print(siteDetail?['id']);
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
      color: Colors.white,
      child: ListView(
        children: [
          const TitleDetail(text: '注文No'),
          ContentDetail(
              text: convertOrderNumber(siteDetail?['order_number'].toString())),
          line(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleDetail(text: '担当者'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: (siteDetail?['factory_floor_members']
                as List<dynamic>?) ==
                    null ||
                    (siteDetail?['factory_floor_members']
                    as List<dynamic>?)!
                        .isEmpty
                    ? [const Text('null')]
                    : List.generate(
                  (siteDetail?['factory_floor_members'] as List<dynamic>)
                      .length,
                      (index) {
                    return Text(
                      '${siteDetail?['factory_floor_members'][index]['first_name']}'
                          ' ${siteDetail?['factory_floor_members'][index]['last_name']}',
                      style: TextStyle(color: context.colors.border),
                    );
                  },
                ),
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
                text: (siteDetail?['factory_floor_occupation'] != null &&
                    siteDetail?['factory_floor_occupation'].isNotEmpty)
                    ? (siteDetail?['factory_floor_occupation'][0]['name'])
                    .toString()
                    : 'null',
              ),
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
              )
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
              )
            ],
          ),
          ContentDetail(text: convertPrice(siteDetail?['total_amount'])),
          const TitleDetail(text: '備考（記載した内容は注文書に反映されます）'),
          ContentDetail(text: (siteDetail?['remarks'] ?? 'null').toString()),
          const Gap(100)
        ],
      ),
    );
  }

  Widget _buildImageTab() {
    List<dynamic>? listImage1 = _currentSiteDetail?['image_type_1'] ?? [];
    int listImage1length =
        listImage1 != null || listImage1!.isNotEmpty ? listImage1.length : 0;
    List<dynamic>? listImage2 = _currentSiteDetail?['image_type_2'] ?? [];
    int listImage2length =
        listImage2 != null || listImage2!.isNotEmpty ? listImage2.length : 0;
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
      color: context.colors.background,
      child: ListView(
        children: [
          const TitleDetail(text: 'Image type 1'),
          SizedBox(
            height: (200 * ((listImage1length / 2).round())).toDouble(),
            child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listImage1length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(247, 248, 250, 1),
                        border: Border.all(
                            color: context.colors.background, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: context.colors.disabled,
                            offset: const Offset(0, 0),
                            blurRadius: 12,
                            spreadRadius: 0.3,
                          ),
                        ],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(32))),
                    child: Image.network(
                      listImage1[index]['url'],
                      fit: BoxFit.contain,
                    ),
                  );
                }),
          ),
          const TitleDetail(text: 'Image type 2'),
          SizedBox(
            height: (200 * ((listImage2length / 2).round())).toDouble(),
            child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listImage2length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(247, 248, 250, 1),
                        border: Border.all(
                            color: context.colors.background, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: context.colors.disabled,
                            offset: const Offset(0, 0),
                            blurRadius: 12,
                            spreadRadius: 0.3,
                          ),
                        ],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(32))),
                    child: Image.network(
                      listImage2[index]['url'],
                      fit: BoxFit.contain,
                    ),
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

  Widget button({required String text, required String icon}) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
        margin: const EdgeInsets.only(right: 16),
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

  Widget editButton() {
    return Positioned(
      bottom: 16,
      left: 36,
      right: 36,
      child: InkWell(
        onTap: (){
          context.router.push(CreateSiteRoute(siteID: _currentSiteDetail!['id']));
        },
        child: Container(
          height: 60,
          width: double.maxFinite,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 0),
                ),
              ],
              color: context.colors.information,
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
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
        ),
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
              color: context.colors.background,
            ),
            height: 260,
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  child: Center(
                    child: Text(
                      _currentSiteDetail?['name']?.toString() ?? 'null',
                      style: const TextStyle(fontSize: 26, height: 0.8),
                    ),
                  ),
                ),
                line(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          bottomSheetButton(
                            icon: Assets.icons.svg.icScheduleCardLocation.path,
                            text: '現場から探す',
                            textColor: context.colors.border,
                          ),
                          bottomSheetButton(
                            icon: Assets.icons.svg.icDashboardChat.path,
                            text: 'チャットへ移動',
                            textColor: context.colors.border,
                          ),
                          bottomSheetButton(
                              icon: Assets.icons.svg.icSiteDetailRemove.path,
                              text: '削除',
                              textColor: context.colors.error),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          bottomSheetButton(
                            icon: Assets.icons.svg.icCopy.path,
                            text: '現場を複製',
                            textColor: context.colors.border,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  Widget bottomSheetButton({required String icon, required String text, required Color textColor}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      height: 60,
      child: Column(
        children: [
          SvgPicture.asset(
            icon,
            height: 28,
            width: 28,
          ),
          Text(
            text,
            style: TextStyle(color: textColor),
          )
        ],
      ),
    );
  }
}
