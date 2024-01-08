import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/data/models/response/account.dart';
import 'package:uq_system_app/data/sources/local/local.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/dashboard/chat/chat_bloc.dart';
import 'package:uq_system_app/presentation/widgets/dashboard_app_bar.dart';

@RoutePage()
class DashBoardChatPage extends StatefulWidget {
  @override
  State<DashBoardChatPage> createState() => _DashBoardChatPageState();
}

class _DashBoardChatPageState extends State<DashBoardChatPage> {
  final ChatBloc _bloc = getIt.get<ChatBloc>();
  final LocalDataSource _localDataSource = getIt.get<LocalDataSource>();
  @override
  void dispose() {
    _bloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: FutureBuilder<Account?>(
          future: _localDataSource.getAccount(),
          builder: (context, snapshot) {
            var account = snapshot.data;
            return Scaffold(
              appBar: DashBoardAppBar(
                  leftIcPath: Assets.icons.svg.icMenu.path, title: 'チャット'),
              body: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (account?.role == 1 || (account?.company.type == 1 && account?.role == 2)) ...[
                      _buildNegotiateRoom(context),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                    _buildOnsiteInformationRoom(context)
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _buildNegotiateRoom(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: context.colors.primary),
          borderRadius: BorderRadius.circular(15)),
      child: Column(children: [
        Container(
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Color(0xFFDDEAF7)),
          child: AssetGenImage(
            Assets.images.imgNegotiate.path,
          ).image(height: 100),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "交渉ルーム",
          style: context.typographies.title1Normal,
        )
      ]),
    );
  }

  Widget _buildOnsiteInformationRoom(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: context.colors.primary),
          borderRadius: BorderRadius.circular(15)),
      child: Column(children: [
        Container(
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Color(0xFFFFF2CC)),
          child: AssetGenImage(
            Assets.images.imgOnsiteInformation.path,
          ).image(height: 100),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "現場情報ルーム",
          style: context.typographies.title1Normal,
        )
      ]),
    );
  }
}
