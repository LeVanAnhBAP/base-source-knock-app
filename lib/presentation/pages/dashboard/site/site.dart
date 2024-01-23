import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/presentation/navigation/navigation.dart';
import 'package:uq_system_app/presentation/widgets/app_bar.dart';
import 'package:uq_system_app/presentation/widgets/schedule_card.dart';
import 'package:uq_system_app/presentation/widgets/search_field.dart';
import '../../../../assets.gen.dart';

@RoutePage()
class DashboardSitePage extends StatefulWidget {
  final String accessToken;

  const DashboardSitePage({super.key, required this.accessToken});

  @override
  State<DashboardSitePage> createState() => _DashboardSitePageState();
}

class _DashboardSitePageState extends State<DashboardSitePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  List listData = [];
  String searchText = '';
  int page = 1;
  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    loadData();
    super.initState();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _loadMoreData();
    }
  }

  Future<void> loadData() async {
    List<dynamic> searchData = await searchSite(searchText: searchText, page: page);
    setState(() {
      listData.addAll(searchData);
    });
  }
  Future<void> loadSearchData() async {
    List<dynamic> searchData = await searchSite(searchText: searchText, page: page);
    setState(() {
      listData=searchData;
    });
  }
  Future<List<dynamic>> searchSite(
      {required String searchText, required int page}) async {
    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer ${widget.accessToken}';
    String api =
        "https://dev-knock-api.oneknockapp.com/api/v1/user/factory-floors?page=$page&name=$searchText";
    try {
      Response response = await dio.get(api);

      if (response.statusCode == 200) {
        return response.data['data']['data'];
      } else {
        print('Failed to load data');
        return [];
      }
    } catch (e) {
      print('An error occurred: $e');
      return [];
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
      drawer: Drawer(
        child: ListView(
          children: const [
            Text('avdvfvd'),
            Text('fvd'),
            Text('avdvfvd'),
            Text('avdvfvd'),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            searchBox(),
            const Gap(28),
            listCard(),
          ],
        ),
      ),
    );
  }

  Widget listCard() {
    print(listData.length);
    print(listData);
    if (listData.isNotEmpty && listData != null) {
      return Expanded(
        child: Scrollbar(
          thickness: 8,
          isAlwaysShown: true,
          controller: _scrollController,
          child: ListView.builder(
            controller: _scrollController,
            itemCount: listData.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  ScheduleCard(
                    title: listData[index]['name'] ?? 'null',
                    location: listData[index]['address'] ?? 'null',
                    dayFrom: listData[index]['start_day_request'],
                    dayTo: listData[index]['end_day_request'],
                    company: listData[index]['company_name_kana'],
                    companyLogo: Assets.icons.png.icScheduleCardCompanyLogo.path,
                    clickDropRight: () {
                      if (listData[index]['status'].toString() == '0') {
                        context.router.push(const CreateSiteRoute());
                      } else {
                        context.router.push(SiteDetailsRoute(
                          id: listData[index]['id'].toString(),
                          accessToken: widget.accessToken,
                        ));
                      }
                    },
                    status: statusCheck(listData[index]['status'].toString()),
                    scheduleCreator:
                    '${listData[index]['first_name']} ${listData[index]['last_name']}',
                  ),
                  const SizedBox(height: 16),
                ],
              );
            },
          ),
        ),
      );
    } else {
      return const CircularProgressIndicator();
    }
  }

  ScheduleCardStatus statusCheck(String statusData) {
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

  Widget searchBox() {
    bool isLoading = false;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child:SearchField(
        onSearchValue: (value) async {
          if (isLoading) {
            return;
          }
          setState(() {
            isLoading = true;
            searchText = value;
            page = 1;
          });
          try {
            await loadSearchData();
          } finally {
            setState(() {
              isLoading = false;
            });
          }
        },
        backgroundColor: context.colors.background,
        borderRadius: const BorderRadius.all(Radius.circular(32)),
        placeholder: '現場名検索',
        clickSearch: () {},
      ),
    );
  }


  void _loadMoreData() {
    setState(() {
      page++;
      loadData();
    });
  }
}
