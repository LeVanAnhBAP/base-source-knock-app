import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/presentation/widgets/app_bar.dart';
import 'package:uq_system_app/presentation/widgets/schedule_card.dart';
import 'package:uq_system_app/presentation/widgets/search_field.dart';
import '../../../../assets.gen.dart';

@RoutePage()
class DashboardSitePage extends StatefulWidget {
  const DashboardSitePage({super.key});
  @override
  State<DashboardSitePage> createState() => _DashboardSitePageState();
}

class _DashboardSitePageState extends State<DashboardSitePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
    return Expanded(
      child: ListView(
        children: List.generate(3, (index) {
          return Column(
            children: [
              ScheduleCard(
                title: '千葉県稲毛市クロス貼り替え',
                location: '東京都稲城市東長沼2111',
                dayFrom: DateTime.now(),
                dayTo: DateTime.now().add(const Duration(days: 2)),
                company: '(株)職人インテリア',
                companyLogo: Assets.icons.png.icScheduleCardCompanyLogo.path,
                clickDropRight: () {},
              ),
              SizedBox(height: index == 2 ? 0 : 16)
            ],
          );
        }),
      ),
    );
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
      ),
    );
  }
}
