import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/presentation/pages/dashboard/createSite/create_site_bloc.dart';
import 'package:uq_system_app/presentation/pages/dashboard/createSite/create_site_event.dart';
import 'package:uq_system_app/presentation/pages/dashboard/createSite/create_site_state.dart';
import 'package:uq_system_app/presentation/widgets/dropdown_address_button.dart';
import 'package:uq_system_app/presentation/widgets/title_detail.dart';

import '../../../../assets.gen.dart';
import '../../../widgets/back_button_app_bar.dart';
import '../../../widgets/input_field.dart';

@RoutePage()
class CreateSitePage extends StatefulWidget {
  final int siteID;

  const CreateSitePage({required this.siteID});

  @override
  State<StatefulWidget> createState() => _CreateSiteState();
}

class _CreateSiteState extends State<CreateSitePage>
    with TickerProviderStateMixin {
  late final CreateSiteBloc _createSiteBloc;
  late final TabController _tabController;
  TextEditingController orderNumberController = TextEditingController();
  TextEditingController constructionDetailsController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController contentRequestController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController wardsController = TextEditingController();
  TextEditingController buildingController = TextEditingController();
  DateTime? selectedStartDay;
  DateTime? selectedEndDay;
  List<String> listProvince = [
    'js',
    'ujaow',
    'omfj',
    'shtgtthyhytjyujtjjj',
    's',
    'sda',
    'qankn',
    'shdbj',
    'jsjbjh',
    'njkenknnr',
    'eowp',
    'zskj'
  ];
  List<String> listCity = [
    'js',
    'ujaow',
    'omfj',
    'sh',
    's',
    'sda',
    'qankn',
    'shdbjaaaaa',
    'jsjbjh'
  ];
  List<String> listTown = [
    'js',
    'ujaow',
    'omfj',
    'sh',
    's',
    'sda',
    'qanknmjjkjkjo',
    'shdbj',
    'jsjbjh'
  ];
  String provinceDropdownValue = 'js';
  String cityDropdownValue = 'js';
  String townDropdownValue = 'js';

  @override
  void initState() {
    _createSiteBloc = CreateSiteBloc();
    _createSiteBloc.add(CreateSiteGetDataStarted(id: widget.siteID));
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _createSiteBloc.stream.listen((state) {
      initControllers(state);
    });
  }

  void initControllers(CreateSiteState state) {
    if (state.status == CreateSiteStatus.success && state.site != null) {
      setControllerValues(state.site!);
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
  void setControllerValues(Map<String, dynamic> site) {
    orderNumberController.text = (site['order_number'] ?? 'null').toString();
    codeController.text = (site['code'] ?? 'null').toString();
    nameController.text = (site['name'] ?? 'null').toString();
    contentRequestController.text =
        (site['content_request'] ?? 'null').toString();
    occupationController.text =
        (site['factory_floor_occupation'][0]['name'] ?? 'null').toString();
    wardsController.text = (site['wards'] ?? 'null').toString();
    buildingController.text = (site['building_number'] ?? 'null').toString();
  }

  String dateFormatFromString(String date) {
    return DateFormat('yyyy/MM/dd').format(DateTime.parse(date));
  }

  String dateFormatFromDateTime(DateTime date) {
    final formatter = DateFormat('yyyy/MM/dd');
    return formatter.format(date);
  }

  Future<void> _selectStartDay(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedStartDay ?? DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedStartDay) {
      setState(() {
        selectedStartDay = pickedDate;
      });
    }
  }

  Future<void> _selectEndDay(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedEndDay ?? DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedEndDay) {
      setState(() {
        selectedEndDay = pickedDate;
      });
    }
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
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
      ),
    );
  }

  Widget siteDetailTab(Map<String, dynamic>? site) {
    if (site == null) {
      return const Text('');
    } else {
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
                              height: 28,
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
              margin: const EdgeInsets.symmetric(vertical: 8),
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
            InputField(controller: codeController),
            const TitleDetail(text: '工事名'),
            InputField(
                maxLength: 15,
                onChangedValue: (value) {
                  setState(() {
                    nameController.text = value;
                  });
                },
                controller: nameController),
            Align(
              alignment: Alignment.centerRight,
              child: Text('${nameController.text.length}/15'),
            ),
            const TitleDetail(text: '工事内容'),
            InputField(
                maxLines: null,
                height: 280,
                onChangedValue: (value) {
                  setState(() {
                    contentRequestController.text = value;
                  });
                },
                controller: contentRequestController),
            Align(
              alignment: Alignment.centerRight,
              child: Text('${contentRequestController.text.length}/500'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TitleDetail(text: '職種'),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Assets.icons.svg.drawerButton.path,
                      height: 20,
                    ))
              ],
            ),
            InputField(controller: occupationController),
            const TitleDetail(text: '工期'),
            Row(
              children: [
                pickDateBox(
                    date: selectedStartDay != null
                        ? dateFormatFromDateTime(selectedStartDay!)
                        : dateFormatFromString(site['start_day_request']),
                    pickDate: () {
                      _selectStartDay(context);
                    }),
                const Gap(4),
                const Text('~'),
                const Gap(4),
                pickDateBox(
                    date: selectedEndDay != null
                        ? dateFormatFromDateTime(selectedEndDay!)
                        : dateFormatFromString(site['end_day_request']),
                    pickDate: () {
                      _selectEndDay(context);
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TitleDetail(text: '工事場所'),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28, vertical: 4),
                        decoration: BoxDecoration(
                            color: context.colors.alert,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(24))),
                        child: Text(
                          '地図',
                          style: TextStyle(color: context.colors.text),
                        ),
                      ),
                    ),
                    const Gap(8)
                  ],
                )
              ],
            ),
            const TitleDetail(text: '都道府県'),
            DropdownAddress(
              list: listProvince,
              dropdownValue: provinceDropdownValue,
              onChanged: (String? value) {
                setState(() {
                  provinceDropdownValue = value!;
                });
              },
            ),
            const TitleDetail(text: '市区町村'),
            DropdownAddress(
              list: listCity,
              dropdownValue: cityDropdownValue,
              onChanged: (String? value) {
                setState(() {
                  cityDropdownValue = value!;
                });
              },
            ),
            const TitleDetail(text: '町域'),
            DropdownAddress(
              list: listTown,
              dropdownValue: townDropdownValue,
              onChanged: (String? value) {
                setState(() {
                  townDropdownValue = value!;
                });
              },
            ),
            const TitleDetail(text: '番地以降'),
            InputField(controller: wardsController),
            const TitleDetail(text: '建物名称等'),
            InputField(controller: buildingController),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TitleDetail(text: '注文合計金額'),
                orderDetailsButton(
                    text: '注文明細',
                    icon: Assets.icons.svg.icSiteDetailsOrderDetail.path)
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 60,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: const Color.fromRGBO(235, 235, 235, 1),
                border: Border.all(color: context.colors.background, width: 2),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    blurRadius: 2,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child:  Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    convertPrice(site['total_amount']),
                    style: const TextStyle(fontSize: 18),
                  )),
            )
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

  pickDateBox({required String date, required Function() pickDate}) {
    return Expanded(
      child: InkWell(
        onTap: pickDate,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          padding: const EdgeInsets.all(8),
          height: 56,
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 0),
                  blurRadius: 6,
                  spreadRadius: 4,
                ),
              ],
              border: Border.all(color: context.colors.background, width: 2),
              color: const Color.fromRGBO(247, 248, 250, 1),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: Row(
            children: [
              SvgPicture.asset(Assets.icons.svg.icCalendar.path),
              const Gap(8),
              Text(date)
            ],
          ),
        ),
      ),
    );
  }

  Widget orderDetailsButton({required String text, required String icon}) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
}
