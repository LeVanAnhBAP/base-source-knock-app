import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/presentation/navigation/navigation.dart';
import 'package:uq_system_app/presentation/pages/dashboard/site/site_event.dart';
import 'package:uq_system_app/presentation/pages/dashboard/site/site_state.dart';
import 'package:uq_system_app/presentation/widgets/app_bar.dart';
import 'package:uq_system_app/presentation/widgets/dashboard_drawer.dart';
import 'package:uq_system_app/presentation/widgets/schedule_card.dart';
import 'package:uq_system_app/presentation/widgets/search_field.dart';
import '../../../../assets.gen.dart';
import 'site_bloc.dart';

@RoutePage()
class DashboardSitePage extends StatelessWidget {
  final String accessToken;

  const DashboardSitePage({Key? key, required this.accessToken})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SiteBloc()
        ..add(DashboardSiteGetDataStarted(
          accessToken: accessToken,
        )),
      child: DashboardSitePageContent(accessToken: accessToken),
    );
  }
}

class DashboardSitePageContent extends StatefulWidget {
  final String accessToken;

  const DashboardSitePageContent({Key? key, required this.accessToken})
      : super(key: key);

  @override
  State<DashboardSitePageContent> createState() =>
      _DashboardSitePageContentState();
}

class _DashboardSitePageContentState extends State<DashboardSitePageContent> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      context
          .read<SiteBloc>()
          .add(DashboardSiteLoadMoreData(accessToken: widget.accessToken));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBars(
        title: '現場',
        openDrawer: () {
          _scaffoldKey.currentState!.openDrawer();
        },
        rightButtonIcon: Assets.icons.svg.icFeatherBell.path,
      ),
      drawer: DashboardDrawer(context: context),
      body: Container(
        margin: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            _searchBox(),
            const Gap(28),
            _listCard(),
          ],
        ),
      ),
    );
  }

  Widget _searchBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SearchField(
        onSearchValue: (value) async {
          context.read<SiteBloc>().add(DashboardSiteLoadSearchData(
                accessToken: widget.accessToken,
                searchText: value,
              ));
        },
        backgroundColor: context.colors.background,
        borderRadius: const BorderRadius.all(Radius.circular(32)),
        placeholder: '現場名検索',
        clickSearch: () {},
      ),
    );
  }

  Widget _listCard() {
    return Expanded(
      child: BlocBuilder<SiteBloc, SiteState>(
        builder: (context, state) {
          if (state.status == SiteStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == SiteStatus.success) {
            if (state.listSite != null && state.listSite!.isNotEmpty) {
              return Scrollbar(
                thickness: 8,
                isAlwaysShown: true,
                controller: _scrollController,
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: state.listSite!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        ScheduleCard(
                          title: state.listSite![index]['name'] ?? 'null',
                          location: state.listSite![index]['address'] ?? 'null',
                          dayFrom: state.listSite![index]['start_day_request'],
                          dayTo: state.listSite![index]['end_day_request'],
                          company: state.listSite![index]
                                  ['company_name_kana'] ??
                              'null',
                          companyLogo:
                              Assets.icons.png.icScheduleCardCompanyLogo.path,
                          clickDropRight: () {
                            if (state.listSite![index]['status'].toString() ==
                                '0') {
                              context.router.push(const CreateSiteRoute());
                            } else {
                              context.router.push(
                                SiteDetailsRoute(
                                  id: state.listSite![index]['id'].toString(),
                                  accessToken: widget.accessToken,
                                ),
                              );
                            }
                          },
                          status: _statusCheck(
                              state.listSite![index]['status'].toString()),
                          scheduleCreator:
                              '${state.listSite![index]['first_name']} ${state.listSite![index]['last_name']}',
                        ),
                        const SizedBox(height: 16),
                      ],
                    );
                  },
                ),
              );
            } else {
              return const Center(child: Text('No data available.'));
            }
          } else {
            return const Center(child: Text('Failed to load data.'));
          }
        },
      ),
    );
  }

  ScheduleCardStatus _statusCheck(String statusData) {
    ScheduleCardStatus statusCheck = ScheduleCardStatus.seven;
    switch (statusData) {
      case '0':
        statusCheck = ScheduleCardStatus.one;
        break;
      case '1':
        statusCheck = ScheduleCardStatus.one;
        break;
      case '2':
        statusCheck = ScheduleCardStatus.two;
        break;
      case '3':
        statusCheck = ScheduleCardStatus.three;
        break;
      case '4':
        statusCheck = ScheduleCardStatus.four;
        break;
      case '5':
        statusCheck = ScheduleCardStatus.five;
        break;
      case '6':
        statusCheck = ScheduleCardStatus.six;
        break;
      case '7':
        statusCheck = ScheduleCardStatus.seven;
        break;
    }
    return statusCheck;
  }
}
