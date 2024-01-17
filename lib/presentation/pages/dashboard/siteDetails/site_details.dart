import 'dart:io';
import 'dart:core';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/presentation/widgets/back_button_app_bar.dart';
import 'package:uq_system_app/presentation/widgets/content_detail.dart';
import 'package:uq_system_app/presentation/widgets/input_field.dart';
import 'package:uq_system_app/presentation/widgets/title_detail.dart';

import '../../../../assets.gen.dart';

@RoutePage()
class SiteDetailsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SiteDetailsState();
}

class _SiteDetailsState extends State<SiteDetailsPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackAppBar(
        title: '現場詳細情報',
      ),
      body: Container(
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
                const Gap(16),
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
                            indicator: BoxDecoration(
                                color: context.colors.backgroundDark,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(24))),
                            labelStyle:
                                TextStyle(color: context.colors.background),
                            unselectedLabelStyle:
                                TextStyle(color: context.colors.backgroundDark),
                            controller: _tabController,
                            tabs: const [
                              Tab(text: '現場詳細'),
                              Tab(text: '画像'),
                            ],
                          ),
                        ),
                        const Gap(16),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              detailSiteTab(),
                              imageTab(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                children: [
                  const Expanded(child: SizedBox()),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 36),
                    height: 60,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            spreadRadius: 1.5,
                            blurRadius: 5,
                            offset: const Offset(0, 0),
                          ),
                        ],
                        color: context.colors.primary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                    child: Center(
                        child: Text(
                      '修正画面へ移動',
                      style: TextStyle(
                        color: context.colors.background,
                        fontSize: 20,
                      ),
                    )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  detailSiteTab() {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
      color: context.colors.background,
      child: ListView(
        children: [
          const TitleDetail(text: '注文No'),
          const ContentDetail(text: '00274'),
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
          const ContentDetail(text: 'Site 16'),
          const TitleDetail(text: '工事名'),
          const ContentDetail(text: 'Site 16'),
          const TitleDetail(text: '工事内容'),
          const ContentDetail(text: 'Site 16'),
          line(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [TitleDetail(text: '職種'), ContentDetail(text: 'インテリア工事'),],
          ),
          line(),
          const TitleDetail(text: '工期'),
          const ContentDetail(text: '2023/10/10  ~  2023/10/15'),
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
          const ContentDetail(text: '東京都新宿区〇〇〇〇町　1-1-1Knockハウス101号室'),
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
          const ContentDetail(text: '33,000円のうち、材料費として前払金3,000円払う')
        ],
      ),
    );
  }

  imageTab() {
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

  line() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 0.5,
      color: context.colors.border,
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
