import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/data/models/response/woker.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/dashboard/search/search_bloc.dart';
import 'package:uq_system_app/presentation/pages/dashboard/search/widgets/search_item.dart';
import 'package:uq_system_app/presentation/widgets/dashboard_app_bar.dart';

@RoutePage()
class DashBoardSearchPage extends StatefulWidget {
  @override
  State<DashBoardSearchPage> createState() => _DashBoardSearchPageState();
}

class _DashBoardSearchPageState extends State<DashBoardSearchPage> {
  final SearchBloc _bloc = getIt.get<SearchBloc>();

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
          title: "探す",
          rightIcPath: Assets.icons.svg.icDashboardSearch.path,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            _buildList(),
          ],
        ),
      ),
    );
  }

  Widget _buildList() {
    var wokers = <Worker>[
      const Worker(
          title: "内装職人Knock",
          content: "はじめまして。内装工事を専門に行なっている職人インテリアと言います。よろしくお願いいたします。",
          address: "東京都 / 埼玉県 / 神奈川県",
          job: "インテリア工事 / 天井仕上げ工事",
          amount: 3,
          isDone: true),
      const Worker(
          title: "防水職人Knock",
          content: "はじめまして。内装工事を専門に行なっているAPOリフォームと言います。よろしくお願いいたします。",
          address: "東京都 / 埼玉県 / 神奈川県",
          job: "インテリア工事 / 天井仕上げ工事",
          amount: 3,
          isDone: false)
    ];
    return ListView.builder(
      itemCount: wokers.length,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) => SearchItem(
        worker: wokers[index],
      ),
    );
  }
}
