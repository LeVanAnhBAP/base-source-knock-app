import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/presentation/pages/dashboard/createSite/create_site_bloc.dart';
import 'package:uq_system_app/presentation/pages/dashboard/createSite/create_site_event.dart';
import 'package:uq_system_app/presentation/pages/dashboard/createSite/create_site_state.dart';
import 'package:uq_system_app/presentation/widgets/title_detail.dart';

import '../../../../assets.gen.dart';
import '../../../widgets/back_button_app_bar.dart';
import '../../../widgets/input_field.dart';

@RoutePage()
class CreateSitePage extends StatefulWidget {
  final int siteID;
  final String accessToken;

  const CreateSitePage({required this.siteID, required this.accessToken});

  @override
  State<StatefulWidget> createState() => _CreateSiteState();
}

class _CreateSiteState extends State<CreateSitePage>
    with TickerProviderStateMixin {
  late final CreateSiteBloc _createSiteBloc;
  late final TabController _tabController;
  TextEditingController orderNumberController = TextEditingController();
  TextEditingController constructionDetailsController = TextEditingController();

  @override
  void initState() {
    _createSiteBloc = CreateSiteBloc();
    _createSiteBloc.add(CreateSiteGetDataStarted(
        accessToken: widget.accessToken, id: widget.siteID));
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _createSiteBloc,
      child: Scaffold(
        appBar: const BackAppBar(
          title: '現場詳細情報',
          rightButton: SizedBox(),
        ),
        body: BlocBuilder<CreateSiteBloc, CreateSiteState>(
          builder: (context, state) {
            return state.status == CreateSiteStatus.loading
                ? _buildLoadingWidget()
                : state.status == CreateSiteStatus.failure
                    ? _buildErrorWidget(state.error?.message)
                    : _buildBody(state.site);
          },
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: context.colors.background,
          height: MediaQuery.of(context).size.height / 9,
          child: Row(
            children: [
              Expanded(
                child: button(
                    backgroundColor: context.colors.background,
                    borderColor: context.colors.border,
                    textColor: context.colors.border,
                    text: '保存'),
              ),
              const Gap(16),
              Expanded(
                child: button(
                    backgroundColor: context.colors.secondary,
                    borderColor: context.colors.secondary,
                    textColor: context.colors.background,
                    text: '登録'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(Map<String, dynamic>? site) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(24))),
                      labelStyle: TextStyle(color: context.colors.background),
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
                        siteDetailTab(site),
                        const Center(
                          child: Text('Content for Tab 2'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget siteDetailTab(Map<String, dynamic>? site) {
    if (site == null) {
      return const Text('');
    } else {
      orderNumberController.text = (site['order_number'] ?? 'null').toString();
      return Container(
        padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
        color: context.colors.background,
        child: ListView(
          children: [
            const TitleDetail(text: '注文No'),
            InputField(controller: orderNumberController),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TitleDetail(text: '担当者'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: (site['factory_floor_members'] as List<dynamic>?) ==
                              null ||
                          (site['factory_floor_members'] as List<dynamic>?)!
                              .isEmpty
                      ? [const Text('null')]
                      : List.generate(
                          (site['factory_floor_members'] as List<dynamic>)
                              .length,
                          (index) {
                            return SizedBox(
                              height: 24,
                              child: Row(
                                children: [
                                  Text(
                                    '${site['factory_floor_members'][index]['first_name']}'
                                    ' ${site['factory_floor_members'][index]['last_name']}',
                                    style:
                                        TextStyle(color: context.colors.border),
                                  ),
                                  const Gap(12),
                                  SvgPicture.asset(
                                      Assets.icons.svg.icRemove.path)
                                ],
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8=),
              color: context.colors.border,
              height: 1,
            ),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    Assets.icons.svg.icAddBlue.path,
                    height: 16,
                  ),
                  Text(
                    '担当者を追加する',
                    style: TextStyle(color: context.colors.primary),
                  ),
                  const SizedBox(width: 12)
                ],
              ),
            ),
            const TitleDetail(text: '工事コード'),
            InputField(controller: TextEditingController()),
            const TitleDetail(text: '工事名'),
            InputField(
                onChangedValue: (value) {
                  setState(() {
                    constructionDetailsController.text = value;
                  });
                },
                textFieldHintText: '0031',
                controller: constructionDetailsController),
            Align(
              alignment: Alignment.centerRight,
              child:
                  Text('${constructionDetailsController.text.length}/15'),
            ),
            const TitleDetail(text: '工事内容'),
            InputField(
                maxLines: null,
                height: 240,
                onChangedValue: (value) {
                  setState(() {
                    constructionDetailsController.text = value;
                  });
                },
                textFieldHintText: '0031',
                controller: constructionDetailsController),
            Align(
              alignment: Alignment.centerRight,
              child:
                  Text('${constructionDetailsController.text.length}/500'),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildLoadingWidget() {
    return const Center(
      child: SizedBox(
        width: 32,
        height: 32,
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildErrorWidget(String? error) {
    return Center(
      child: Text('Error: $error'),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget button(
      {required Color backgroundColor,
      required Color borderColor,
      required Color textColor,
      required String text}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 14,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              textStyle: TextStyle(color: textColor, fontSize: 20),
              side: BorderSide(color: borderColor, width: 4),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              padding: EdgeInsets.zero),
          onPressed: () {},
          child: Text(
            text,
            style: TextStyle(color: textColor),
          )),
    );
  }
}
