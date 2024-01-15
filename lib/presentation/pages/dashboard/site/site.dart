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
  List listData = [];
  Future<void> loadSite() async {
    if (widget.accessToken != null) {
      final dio = Dio();
      dio.options.headers['Authorization'] = 'Bearer ${widget.accessToken}';
      String api =
          "https://dev-knock-api.oneknockapp.com/api/v1/user/factory-floors?page=1&name=a";
      try {
        Response response = await dio.get(api);

        if (response.statusCode == 200) {
          listData = response.data['data']['data'];
        } else {
          print('Failed to load data');
        }
      } catch (e) {
        print('An error occurred: $e');
      }
    } else {
      print('Access token is null');
    }
  }

  Widget widgetBody = const Expanded(
      child: Center(
    child: Text('adjdsdjkfnjkdfnjs'),
  ));
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
            widgetBody,
          ],
        ),
      ),
    );
  }

  Widget listCard() {
    return Expanded(
      child: ListView(
        children: List.generate(3, (index) {
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
                    context.router.push(const SiteDetailsRoute());
                  }
                },
                status: statusCheck(listData[index]['status'].toString()),
                scheduleCreator:
                    '${listData[index]['first_name']} ${listData[index]['last_name']}',
              ),
              SizedBox(height: index == 2 ? 0 : 16)
            ],
          );
        }),
      ),
    );
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SearchField(
        onSearchValue: (value) {
          print(value);
        },
        backgroundColor: context.colors.background,
        borderRadius: const BorderRadius.all(Radius.circular(32)),
        placeholder: '現場名検索',
        clickSearch: () {
          setState(() {
            widgetBody = futureBuilder();
          });
        },
      ),
    );
  }

  Widget futureBuilder() {
    return FutureBuilder<String>(
        future: future(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            widgetBody = listCard();
          } else {
            if (snapshot.hasError) {
              widgetBody = Text('Error: ${snapshot.error}');
            } else {
              widgetBody = CircularProgressIndicator(
                color: context.colors.primary,
              );
            }
          }
          return widgetBody;
        });
  }

  Future<String> future() async {
    await loadSite();
    return 'abc';
  }
}
