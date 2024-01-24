import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/presentation/pages/create_site/create_site_bloc.dart';
import 'package:uq_system_app/presentation/pages/create_site/create_site_selector.dart';

import '../../../../assets.gen.dart';
import '../../../../core/languages/translation_keys.g.dart';
import '../../../../data/models/response/common_item_response.dart';
import '../../../../data/models/response/occupation_response.dart';
import '../../../../domain/entities/member.dart';
import '../../../../utils/utils.dart';
import '../../../navigation/navigation.dart';
import '../../../widgets/divider_line.dart';
import '../../../widgets/droplist_input_item.dart';
import '../../../widgets/input_container.dart';
import '../../../widgets/main_text_field.dart';
import '../../order_details/order_details.dart';
import '../create_site_event.dart';
import '../create_site_state.dart';
import 'member_item.dart';

class DetailsTab extends StatefulWidget {
  final int userId;

  const DetailsTab(this.userId);

  @override
  State<DetailsTab> createState() => _DetailsTabState();
}

class _DetailsTabState extends State<DetailsTab> {
  late CreateSiteBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<CreateSiteBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: _bloc,
        child: SingleChildScrollView(
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
                            .push(
                                SearchMemberRoute(members: _bloc.state.members))
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
                          child: SvgPicture.asset(
                              Assets.icons.svg.icRightBack.path),
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
                                SvgPicture.asset(
                                    Assets.icons.svg.icCalendar2.path),
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
                                SvgPicture.asset(
                                    Assets.icons.svg.icCalendar2.path),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                          color: context.colors.secondary,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        "地図",
                        style: context.typographies.subBody1
                            .withColor(Colors.white),
                      ),
                    )
                  ],
                ),
                PopupMenuButton(
                  padding: EdgeInsets.zero,
                  surfaceTintColor: Colors.white,
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width),
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
                      enabled: _bloc.state.siteParams.factoryFloorAddress?.id !=
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
                              title: context
                                  .tr(LocaleKeys.SiteDetail_Municipalities),
                              content: data != null
                                  ? _bloc.state.cities
                                      .firstWhere(
                                          (element) => element.id == data)
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
                      enabled:
                          _bloc.state.siteParams.factoryFloorAddress?.cityId !=
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
                                      .firstWhere(
                                          (element) => element.id == data)
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
                      onTap: () async {
                        await context.router
                            .push(OrderDetailsRoute(
                                taxRate: double.parse(
                                    _bloc.state.taxRate?.percentage ?? "0"),
                                units: _bloc.state.staticData?.units ??
                                    <CommonItemResponse>[],
                                orders:
                                    _bloc.state.siteParams.priceOrderDetails ??
                                        []))
                            .then((value) {
                          var returnedValues = value as Map<String, dynamic>;
                          _bloc.add(CreateSiteEvent.updateOrders(
                              priceOrders: returnedValues[
                                  OrderDetailsArguments.selectedOccupation],
                              totalAmount: returnedValues[
                                  OrderDetailsArguments.totalAmount]));
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    width: MediaQuery.of(context).size.width,
                    backgroundColor: context.colors.disabled,
                    child: CreateSiteSelector(
                      selector: (state) => state.totalAmount,
                      builder: (data) {
                        return Text(
                          "¥${Utils.formatCurrency(data.toString())}",
                          style: context.typographies.subBodyBold1
                              .withColor(context.colors.primary),
                        );
                      },
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
                      CreateSiteSelector(
                          selector: (state) => state.siteParams.expenses,
                          builder: (data) {
                            return Checkbox(
                                value: data == 1 ? true : false,
                                onChanged: (value) {
                                  _bloc.add(CreateSiteEvent.updateParams(
                                      siteParams: _bloc.state.siteParams
                                          .copyWith(expenses: value! ? 1 : 0)));
                                });
                          }),
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
        ));
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
                            isCanMove: member.roleId != 1 &&
                                member.id != widget.userId,
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

  Future<DateTime?> _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2050));
    return picked;
  }
}
