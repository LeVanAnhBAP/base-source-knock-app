import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/site_details/site_details_bloc.dart';
import 'package:uq_system_app/presentation/widgets/info_item.dart';

import '../../../assets.gen.dart';
import '../../../core/languages/translation_keys.g.dart';
import '../../../data/models/response/account.dart';
import '../../../utils/utils.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../widgets/dashboard_app_bar.dart';

// TODO: Add the page to the router
@RoutePage()
class SiteDetailsPage extends StatefulWidget {
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
      child: Scaffold(
        appBar: DashBoardAppBar(
          title: context.tr(LocaleKeys.SiteDetail_DetailedInformationOnSite),
          leftIcPath: Assets.icons.svg.icLeftBack.path,
          rightIcPath: Assets.icons.svg.icMoreHorizontal.path,
        ),
        body: Column(
          children: [
            _buildHeader(),
            _buildTapBars(),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: Container(
              color: Colors.white,
              child: TabBarView(
                  controller: controller,
                  children: [_buildDetail(), _buildImages()]),
            )),
          ],
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
                          Assets.icons.svg.icSiteStatus1.path,
                          width: 20,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          context.tr(LocaleKeys.OnSite_NotOrdering),
                          style: TextStyle(
                              color: context.colors.secondary, fontSize: 10),
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
          color: const Color(0xFFE4E4E4),
          borderRadius: BorderRadius.circular(20)),
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
            InfoItem(
                title: context.tr(LocaleKeys.SiteDetail_OrderNo),
                content: "200031"),
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
                  child: Container(
                    height: 100,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 2,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Text(
                                textAlign : TextAlign.right,
                                "不動産　太郎",
                                style: context.typographies.subBody1,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

              ],
            ),
            Divider(
              height: 1,
              color: context.colors.divider,
            ),
            InfoItem(title: context.tr(LocaleKeys.SiteDetail_ConstructionCode), content: "TM20003"),
            InfoItem(title: context.tr(LocaleKeys.SiteDetail_ConstructionName), content: "千葉県稲毛市クロス貼り替え"),
            InfoItem(title: context.tr(LocaleKeys.SiteDetail_ConstructionDetails), content: "千葉県稲毛市クロス貼り替え"),
          ],
        ),
      ),
    );
  }

  Widget _buildImages() {
    return Container();
  }
}
