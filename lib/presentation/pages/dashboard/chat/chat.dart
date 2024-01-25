import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/presentation/navigation/navigation.dart';
import 'package:uq_system_app/presentation/widgets/app_bar.dart';
import 'package:uq_system_app/presentation/widgets/dashboard_drawer.dart';
import '../../../../assets.gen.dart';

@RoutePage()
class DashboardChatPage extends StatefulWidget {
  const DashboardChatPage({super.key});
  @override
  State<DashboardChatPage> createState() => _DashboardChatPageState();
}

class _DashboardChatPageState extends State<DashboardChatPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBars(
        title: 'チャット',
        openDrawer: () {
          _scaffoldKey.currentState!.openDrawer();
        },
        isVisibleRightButton: false,
        rightButtonIcon: Assets.icons.svg.icFeatherBell.path,
      ),
      drawer:DashboardDrawer(context: context,),
      body: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 14,
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            item(
              icon: Assets.icons.png.icNegotiationRoom.path,
              title: '交渉ルーム',
            ),
            const Gap(40),
            item(
              icon: Assets.icons.png.icOnSiteInformationRoom.path,
              title: '現場情報ルーム',
            ),
          ],
        ),
      ),
    );
  }

  Widget item({required String icon, required String title}) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
          color: context.colors.background,
          border: Border.all(
            color: context.colors.border,
            width: 2,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(16))),
      child: Center(
        child: InkWell(
          onTap: () {
            context.router.push(const NegotiationRoomRoute());
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(icon),
              Text(
                title,
                style: const TextStyle(fontSize: 28),
              )
            ],
          ),
        ),
      ),
    );
  }
}
