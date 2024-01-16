import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/di/injector.dart';
import 'package:uq_system_app/presentation/widgets/app_bar.dart';

import '../../../../assets.gen.dart';
import 'profile_bloc.dart';

@RoutePage()
class DashboardProfilePage extends StatefulWidget {
  @override
  State<DashboardProfilePage> createState() => _DashboardProfilePageState();
}

class _DashboardProfilePageState extends State<DashboardProfilePage> {
  final AccountBloc _bloc = provider.get<AccountBloc>();
  @override
  void initState() {
    super.initState();
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
        appBar: AppBars(
          title: 'マイページ',
          openDrawer: () {},
          rightButtonIcon: '',
          isVisibleDrawer: false,
          isVisibleRightButton: false,
        ),
        body: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      Assets.icons.png.profileBackground.path,
                      fit: BoxFit.fitWidth,
                    )),
                Padding(
                  padding: EdgeInsets.only(
                      top: 200, left: MediaQuery.of(context).size.width / 10),
                  child: SizedBox(
                    height: 88,
                    width: 88,
                    child: Stack(
                      children: [
                        ClipOval(
                          child: Image.asset(Assets.images.avatar.path),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                            child: SvgPicture.asset(Assets.icons.svg.icCamera.path))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
