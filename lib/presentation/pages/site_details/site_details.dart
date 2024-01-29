import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/data/models/response/site_details_response.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/navigation/navigation.dart';
import 'package:uq_system_app/presentation/pages/site_details/site_details_bloc.dart';
import 'package:uq_system_app/presentation/pages/site_details/site_details_event.dart';
import 'package:uq_system_app/presentation/pages/site_details/site_details_selector.dart';
import 'package:uq_system_app/presentation/pages/site_details/site_details_state.dart';
import 'package:uq_system_app/presentation/pages/site_details/widgets/menu_popup.dart';
import 'package:uq_system_app/presentation/widgets/base_app_bar.dart';
import 'package:uq_system_app/presentation/widgets/info_item.dart';
import 'package:uq_system_app/utils/utils.dart';

import '../../../assets.gen.dart';
import '../../../core/languages/translation_keys.g.dart';
import '../../../data/models/response/account.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../widgets/input_container.dart';

@RoutePage()
class SiteDetailsPage extends StatefulWidget {
  final int siteId;

  const SiteDetailsPage(this.siteId);

  @override
  State<SiteDetailsPage> createState() => _SiteDetailsPageState();
}

class _SiteDetailsPageState extends State<SiteDetailsPage>
    with SingleTickerProviderStateMixin {
  final SiteDetailsBloc _bloc = getIt.get<SiteDetailsBloc>();
  final Account? account = getIt.get<AuthBloc>().state.account;
  late TabController controller;

  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      _bloc.add(SiteDetailsEvent.loadData(siteId: widget.siteId));
    });
    controller = TabController(length: 2, vsync: this);
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
      child: MultiBlocListener(
        listeners: [
          SiteDetailsStatusListener(statuses: const  [SiteDetailsStatus.removed], listener: (context, state) {
            context.router.pop();
          },)
        ],
        child: Scaffold(
          appBar: CustomAppBar(
            context,
            appBarTitle:
                context.tr(LocaleKeys.SiteDetail_DetailedInformationOnSite),
            rightIcPath: Assets.icons.svg.icMoreHorizontal.path,
            onRightPress: () {
              _displayMenuPopup();
            },
          ),
          body: SiteDetailsStatusSelector(
            builder: (data) {
              if (data == SiteDetailsStatus.success) {
                return Column(
                  children: [
                    _buildHeader(),
                    _buildTapBars(),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: Container(
                      color: Colors.white,
                      child: Stack(
                        children: [
                          TabBarView(controller: controller, children: [
                            _buildDetail(_bloc.state.siteDetails!),
                            _buildImages(_bloc.state.siteDetails!)
                          ]),
                          Positioned(
                              bottom: 5,
                              left: 0,
                              right: 0,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    await context.router
                                        .push(CreateSiteRoute(
                                            siteId: widget.siteId))
                                        .then((value) {
                                      if (value != null) {
                                        _bloc.add(SiteDetailsEvent.loadData(
                                            siteId: widget.siteId));
                                      }
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: context.colors.tertiary,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                  child: Text(
                                    context.tr(LocaleKeys
                                        .SiteDetail_MoveToCorrectionScreen),
                                    style: context.typographies.title3Bold
                                        .withColor(Colors.white),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    )),
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return SizedBox(
      height: 70,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  alignment: Alignment.center,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(color: context.colors.tertiary, width: 2),
                  ),
                  child: Text(
                    context.tr(LocaleKeys.SiteDetail_OrderingSite),
                    style: context.typographies.subBodyBold1,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 15,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          Utils.siteStatusToIconPath(_bloc.state.siteDetails!.status),
                          width: 20,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          Utils.siteStatusToString(context,_bloc.state.siteDetails!.status,1),
                          style: TextStyle(
                              color: Utils.siteStatusToColor(_bloc.state.siteDetails!.status, context), fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTapBars() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
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

  Widget _buildDetail(SiteDetailsResponse data) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoItem(
                title: context.tr(LocaleKeys.SiteDetail_OrderNo),
                content: NumberFormat('00000').format(data.orderNumber)),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.tr(LocaleKeys.SiteDetail_Manager),
                  style: context.typographies.subBodyBold1,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: data.members.length,
                            itemBuilder: (context, index) {
                              var member = data.members[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Text(
                                  textAlign: TextAlign.right,
                                  "${member.firstName} ${member.lastName}",
                                  style: context.typographies.subBody1,
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              height: 1,
              color: context.colors.divider,
            ),
            InfoItem(
                title: context.tr(LocaleKeys.SiteDetail_ConstructionCode),
                content: data.code ?? ""),
            InfoItem(
                title: context.tr(LocaleKeys.SiteDetail_ConstructionName),
                content: data.name ?? ""),
            InfoItem(
                title: context.tr(LocaleKeys.SiteDetail_ConstructionDetails),
                content: data.contentRequest ?? ""),
            const SizedBox(
              height: 20,
            ),
            Divider(
              height: 1,
              color: context.colors.divider,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.tr(LocaleKeys.SiteDetail_Occupation),
                    style: context.typographies.subBodyBold1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      data.occupations.isNotEmpty
                          ? data.occupations[0].name
                          : "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.typographies.body,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: context.colors.divider,
            ),
            InfoItem(
                title: context.tr(LocaleKeys.SiteDetail_ConstructionPeriod),
                content:
                    "${data.startDayRequest}    〜    ${data.endDayRequest}"),
            const SizedBox(
              height: 20,
            ),
            Divider(
              height: 1,
              color: context.colors.divider,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.tr(LocaleKeys.SiteDetail_ConstructionSite),
                  style: context.typographies.subBodyBold1,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                      color: context.colors.secondary,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        Assets.icons.svg.icLocation.path,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                        width: 13,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "地図",
                        style: context.typographies.bodyBold
                            .withColor(Colors.white),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                data.address ?? "",
                style: context.typographies.subBody1,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Divider(
              height: 1,
              color: context.colors.divider,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  context.tr(LocaleKeys.SiteDetail_TotalOrderAmount),
                  style: context.typographies.subBodyBold1,
                ),
                Container(
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
                        style: context.typographies.bodyBold
                            .withColor(Colors.white),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "¥${Utils.formatCurrency(data.totalAmount?.toString() ?? "0")}",
                style: context.typographies.subBody1,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InfoItem(
                title: context.tr(LocaleKeys
                    .SiteDetail_RemarksTheContentsDescribedWillBeReflectedInTheOrderForm),
                content: data.remarks ?? ""),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImages(SiteDetailsResponse data) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 100),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.tr(LocaleKeys.SiteDetail_Drawing),
              style: context.typographies.subBodyBold1,
            ),
            const SizedBox(
              height: 10,
            ),
            GridView.builder(
              shrinkWrap: true,
              itemCount: data.imageType1.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 40, mainAxisSpacing: 40, crossAxisCount: 2),
              itemBuilder: (context, index) {
                return InputContainer(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Image.network(
                    data.imageType1[index].url ?? "",
                    fit: BoxFit.contain,
                  ),
                ));
              },
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              context.tr(LocaleKeys.SiteDetail_OnSitePhoto),
              style: context.typographies.subBodyBold1,
            ),
            const SizedBox(
              height: 10,
            ),
            GridView.builder(
              shrinkWrap: true,
              itemCount: data.imageType2.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 40, mainAxisSpacing: 40, crossAxisCount: 2),
              itemBuilder: (context, index) {
                return InputContainer(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Image.network(
                    data.imageType2[index].url ?? "",
                    fit: BoxFit.contain,
                  ),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }

  Future _displayMenuPopup() {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15))
      ),
      context: context,
      builder: (context) => MenuPopup(_bloc),
    );
  }
}
