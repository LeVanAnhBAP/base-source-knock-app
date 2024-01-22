import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/data/models/response/occupation_response.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:uq_system_app/presentation/navigation/navigation.dart';
import 'package:uq_system_app/presentation/pages/create_site/create_site_bloc.dart';
import 'package:uq_system_app/presentation/pages/create_site/create_site_event.dart';
import 'package:uq_system_app/presentation/pages/create_site/create_site_selector.dart';
import 'package:uq_system_app/presentation/pages/create_site/widgets/member_item.dart';
import 'package:uq_system_app/presentation/widgets/divider_line.dart';
import 'package:uq_system_app/presentation/widgets/droplist_input_item.dart';
import 'package:uq_system_app/presentation/widgets/input_container.dart';
import 'package:uq_system_app/presentation/widgets/main_text_field.dart';

import '../../../assets.gen.dart';
import '../../../core/languages/translation_keys.g.dart';
import '../../../data/models/response/common_item_response.dart';
import '../../../domain/entities/member.dart';
import '../../widgets/dashboard_app_bar.dart';
import 'create_site_state.dart';

@RoutePage()
class CreateSitePage extends StatefulWidget {
  @override
  State<CreateSitePage> createState() => _CreateSitePageState();
}

class _CreateSitePageState extends State<CreateSitePage>
    with SingleTickerProviderStateMixin {
  final CreateSiteBloc _bloc = getIt.get<CreateSiteBloc>();
  final int userId = getIt<AuthBloc>().state.account!.id;
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    scheduleMicrotask(() {
      _bloc.add(CreateSiteLoadInfo(userId: userId));
    });
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
        appBar: DashBoardAppBar(
          title: context.tr(LocaleKeys.SiteDetail_DetailedInformationOnSite),
          leftIcPath: Assets.icons.svg.icLeftBack.path,
          onLeftPressed: () {
            context.router.pop();
          },
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.symmetric(vertical: 5),
              alignment: Alignment.center,
              width: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: context.colors.tertiary, width: 2),
              ),
              child: Text(
                context.tr(LocaleKeys.SiteDetail_OrderingSite),
                style: context.typographies.subBodyBold1,
              ),
            ),
            _buildTapBars(),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: Container(
              color: Colors.white,
              child: Stack(
                children: [
                  CreateSiteStatusSelector(builder: (status) {
                    return TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: controller,
                        children: [_buildDetail(), _buildImages()]);
                  }),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 3,
                                            color: context.colors.quaternary),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                child: Text(
                                  "保存",
                                  style: context.typographies.bodyBold
                                      .withColor(context.colors.quaternary),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: context.colors.secondary,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                child: Text(
                                  "登録",
                                  style: context.typographies.bodyBold
                                      .withColor(Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildTapBars() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      height: 35,
      child: TabBar(
        controller: controller,
        indicatorPadding: const EdgeInsets.all(5),
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
            color: const Color(0xFF4A4B4F),
            borderRadius: BorderRadius.circular(15)),
        dividerColor: Colors.transparent,
        labelStyle: context.typographies.subBodyBold1.withColor(Colors.white),
        unselectedLabelStyle: context.typographies.subBodyBold1
            .withColor(const Color(0xFF868686)),
        tabs: [
          Tab(
            text: context.tr(LocaleKeys.SiteDetail_SiteDetails),
          ),
          Tab(
            text: context.tr(LocaleKeys.SiteDetail_Image),
          )
        ],
      ),
    );
  }

  Widget _buildDetail() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildManager(),
            Divider(
              height: 1,
              color: context.colors.divider,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () async {
                    await context.router
                        .push(SearchMemberRoute(members: _bloc.state.members))
                        .then((value) {
                      var newMembers = value as List<Member>;
                      _bloc.add(CreateSiteEvent.updateMembers(
                          newMembers: newMembers));
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        Assets.icons.svg.icPlus.path,
                        width: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "担当者を追加する",
                        style: context.typographies.subBodyBold1
                            .withColor(context.colors.tertiary),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              context.tr(LocaleKeys.SiteDetail_ConstructionCode),
              style: context.typographies.subBodyBold1,
            ),
            const SizedBox(
              height: 5,
            ),
            const MainTextField(),
            const SizedBox(
              height: 20,
            ),
            Text(
              context.tr(LocaleKeys.SiteDetail_ConstructionName),
              style: context.typographies.subBodyBold1,
            ),
            const SizedBox(
              height: 5,
            ),
            const MainTextField(
              maxLength: 15,
              maxLines: 1,
              isCounter: true,
            ),
            Text(
              context.tr(LocaleKeys.SiteDetail_ConstructionDetails),
              style: context.typographies.subBodyBold1,
            ),
            const SizedBox(
              height: 5,
            ),
            const MainTextField(
              maxLength: 500,
              maxLines: 10,
              isCounter: true,
            ),
            const SizedBox(
              height: 10,
            ),
            const DividerLine(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.tr(LocaleKeys.SiteDetail_Occupation),
                    style: context.typographies.subBodyBold1,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: OccupationSelector(builder: (data) {
                      return Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          data?.name ?? "",
                          style: context.typographies.subBodyBold1,
                        ),
                      );
                    }),
                  ),
                  InkWell(
                    onTap: () async {
                      await context.router
                          .push(OccupationRoute(
                              occupations:
                                  _bloc.state.staticData?.occupations ?? [],
                              selectedOccupation: _bloc.state.occupation))
                          .then((value) {
                        if (value != null) {
                          _bloc.add(CreateSiteEvent.updateOccupation(
                              occupation: value as OccupationResponse));
                        }
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child:
                          SvgPicture.asset(Assets.icons.svg.icRightBack.path),
                    ),
                  ),
                ],
              ),
            ),
            const DividerLine(),
            const SizedBox(
              height: 20,
            ),
            Text(
              context.tr(LocaleKeys.SiteDetail_ConstructionPeriod),
              style: context.typographies.subBodyBold1,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      await _selectDate().then((value) {
                        if (value != null) {
                          _bloc.add(CreateSiteEvent.updateParams(
                              siteParams: _bloc.state.siteParams
                                  .copyWith(startDayRequest: value)));
                        }
                      });
                    },
                    child: InputContainer(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        child: Row(
                          children: [
                            SvgPicture.asset(Assets.icons.svg.icCalendar2.path),
                            const SizedBox(
                              width: 10,
                            ),
                            CreateSiteSelector<DateTime?>(
                              builder: (data) {
                                return Text(
                                  DateFormat("yyyy/MM/dd")
                                      .format(data ?? DateTime.now()),
                                  style: context.typographies.subBodyBold1,
                                );
                              },
                              selector: (state) =>
                                  state.siteParams.startDayRequest,
                            ),
                          ],
                        )),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 50,
                  child: Text("〜",
                      style: context.typographies.title3Bold
                          .withColor(context.colors.primary)),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      await _selectDate().then((value) {
                        if (value != null) {
                          _bloc.add(CreateSiteEvent.updateParams(
                              siteParams: _bloc.state.siteParams
                                  .copyWith(endDayRequest: value)));
                        }
                      });
                    },
                    child: InputContainer(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        child: Row(
                          children: [
                            SvgPicture.asset(Assets.icons.svg.icCalendar2.path),
                            const SizedBox(
                              width: 10,
                            ),
                            CreateSiteSelector<DateTime?>(
                              builder: (data) {
                                return Text(
                                  DateFormat("yyyy/MM/dd")
                                      .format(data ?? DateTime.now()),
                                  style: context.typographies.subBodyBold1,
                                );
                              },
                              selector: (state) =>
                                  state.siteParams.endDayRequest,
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.tr(LocaleKeys.SiteDetail_ConstructionSite),
                  style: context.typographies.subBody1
                      .withColor(context.colors.blurryTitle),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                      color: context.colors.secondary,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    "地図",
                    style:
                        context.typographies.subBody1.withColor(Colors.white),
                  ),
                )
              ],
            ),
            PopupMenuButton(
              padding: EdgeInsets.zero,
              surfaceTintColor: Colors.white,
              constraints:
                  BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
              itemBuilder: (BuildContext context) {
                return _bloc.state.prefecture
                    .map((e) => PopupMenuItem(
                        padding: EdgeInsets.zero,
                        onTap: () {
                          _bloc.add(CreateSiteEvent.selectPrefecture(
                              prefectureId: e.id));
                        },
                        height: 30,
                        value: e,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Text(
                            e.name,
                            style: context.typographies.bodyBold,
                          ),
                        )))
                    .toList();
              },
              child: CreateSiteSelector<int?>(
                builder: (data) {
                  return DropListInputItem(
                      title: context.tr(LocaleKeys.SiteDetail_Prefectures),
                      content: data != null
                          ? _bloc.state.prefecture
                              .firstWhere((element) => element.id == data)
                              .name
                          : "");
                },
                selector: (CreateSiteState state) =>
                    state.siteParams.factoryFloorAddress?.id,
              ),
            ),
            CreateSiteSelector(
              builder: (data) {
                return PopupMenuButton(
                  enabled:
                      _bloc.state.siteParams.factoryFloorAddress?.id != null,
                  padding: EdgeInsets.zero,
                  surfaceTintColor: Colors.white,
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width),
                  itemBuilder: (BuildContext context) {
                    return data
                        .map((e) => PopupMenuItem(
                            padding: EdgeInsets.zero,
                            onTap: () {
                              _bloc.add(
                                  CreateSiteEvent.selectCity(cityId: e.id));
                            },
                            height: 30,
                            value: e,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Text(
                                e.name,
                                style: context.typographies.bodyBold,
                              ),
                            )))
                        .toList();
                  },
                  child: CreateSiteSelector<int?>(
                    builder: (data) {
                      return DropListInputItem(
                          title:
                              context.tr(LocaleKeys.SiteDetail_Municipalities),
                          content: data != null
                              ? _bloc.state.cities
                                  .firstWhere((element) => element.id == data)
                                  .name
                              : "");
                    },
                    selector: (CreateSiteState state) =>
                        state.siteParams.factoryFloorAddress?.cityId,
                  ),
                );
              },
              selector: (state) => state.cities,
            ),
            CreateSiteSelector(
              builder: (data) {
                return PopupMenuButton(
                  enabled: _bloc.state.siteParams.factoryFloorAddress?.cityId !=
                      null,
                  padding: EdgeInsets.zero,
                  surfaceTintColor: Colors.white,
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width),
                  itemBuilder: (BuildContext context) {
                    return data
                        .map((e) => PopupMenuItem(
                            padding: EdgeInsets.zero,
                            onTap: () {
                              _bloc.add(
                                  CreateSiteEvent.selectTown(townId: e.id));
                            },
                            height: 30,
                            value: e,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Text(
                                e.name,
                                style: context.typographies.bodyBold,
                              ),
                            )))
                        .toList();
                  },
                  child: CreateSiteSelector<int?>(
                    builder: (data) {
                      return DropListInputItem(
                          title: context.tr(LocaleKeys.SiteDetail_TownArea),
                          content: data != null
                              ? _bloc.state.towns
                                  .firstWhere((element) => element.id == data)
                                  .name
                              : "");
                    },
                    selector: (CreateSiteState state) =>
                        state.siteParams.factoryFloorAddress?.townId,
                  ),
                );
              },
              selector: (state) => state.towns,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              context.tr(LocaleKeys.SiteDetail_AfterTheAddress),
              style: context.typographies.subBodyBold1,
            ),
            const SizedBox(
              height: 5,
            ),
            const MainTextField(),
            const SizedBox(
              height: 20,
            ),
            Text(
              context.tr(LocaleKeys.SiteDetail_BuildingNameEtc),
              style: context.typographies.subBodyBold1,
            ),
            const SizedBox(
              height: 5,
            ),
            const MainTextField(),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.tr(LocaleKeys.SiteDetail_TotalOrderAmount),
                  style: context.typographies.subBodyBold1,
                ),
                InkWell(
                  onTap: () {
                    context.router.push(OrderDetailsRoute(
                        units: _bloc.state.staticData?.units ??
                            <CommonItemResponse>[]));
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                        color: context.colors.secondary,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          Assets.icons.svg.icTotalCent.path,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                          width: 15,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "注文明細",
                          style: context.typographies.subBody1
                              .withColor(Colors.white),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            InputContainer(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                width: MediaQuery.of(context).size.width,
                backgroundColor: context.colors.disabled,
                child: Text(
                  "¥33,000",
                  style: context.typographies.subBodyBold1
                      .withColor(context.colors.primary),
                )),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(right: 5),
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    context.tr(LocaleKeys
                        .SiteDetail_ActualExpensesWillBeSettledSeparately),
                    style: context.typographies.subBodyBold1,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              context.tr(LocaleKeys
                  .SiteDetail_RemarksTheContentsDescribedWillBeReflectedInTheOrderForm),
              style: context.typographies.subBodyBold1,
            ),
            const SizedBox(
              height: 5,
            ),
            const MainTextField(
              height: 250,
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildManager() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr(LocaleKeys.SiteDetail_Manager),
            style: context.typographies.subBodyBold1,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: ListMemberSelector(builder: (data) {
                    var selectedMembers =
                        data.where((element) => element.isSelected).toList();
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: selectedMembers.length,
                        itemBuilder: (context, index) {
                          var member = selectedMembers[index];
                          return MemberItem(
                            member: member,
                            isCanMove:
                                member.roleId != 1 && member.id != userId,
                            onRemove: (id) {
                              _bloc.add(CreateSiteEvent.removeMember(id: id));
                            },
                          );
                        });
                  }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImages() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              context.tr(LocaleKeys.SiteDetail_Drawing),
              style: context.typographies.subBodyBold1,
            ),
            const SizedBox(
              height: 5,
            ),
            InputContainer(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 20),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InputContainer(
                      padding: const EdgeInsets.symmetric(
                          vertical: 40, horizontal: 30),
                      backgroundColor: Colors.white,
                      child: Column(
                        children: [
                          AssetGenImage(Assets.icons.png.icGallery.path)
                              .image(width: 35),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            context.tr(LocaleKeys.SiteDetail_Upload),
                            style: context.typographies.bodyBold
                                .withColor(context.colors.tertiary),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      Assets.icons.svg.icPlus.path,
                      width: 15,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      context.tr(LocaleKeys.SiteDetail_AddDrawing),
                      style: context.typographies.subBodyBold1
                          .withColor(context.colors.tertiary),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              context.tr(LocaleKeys.SiteDetail_OnSitePhoto),
              style: context.typographies.subBodyBold1,
            ),
            const SizedBox(
              height: 5,
            ),
            InputContainer(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 20),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InputContainer(
                      padding: const EdgeInsets.symmetric(
                          vertical: 40, horizontal: 30),
                      backgroundColor: Colors.white,
                      child: Column(
                        children: [
                          AssetGenImage(Assets.icons.png.icGallery.path)
                              .image(width: 35),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            context.tr(LocaleKeys.SiteDetail_Upload),
                            style: context.typographies.bodyBold
                                .withColor(context.colors.tertiary),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      Assets.icons.svg.icPlus.path,
                      width: 15,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      context.tr(LocaleKeys.SiteDetail_AddDrawing),
                      style: context.typographies.subBodyBold1
                          .withColor(context.colors.tertiary),
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

  Future<DateTime?> _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2050));
    return picked;
  }
}
