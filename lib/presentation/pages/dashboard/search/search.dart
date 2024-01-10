

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/data/models/response/partner_response.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/dashboard/search/search_bloc.dart';
import 'package:uq_system_app/presentation/pages/dashboard/search/search_event.dart';
import 'package:uq_system_app/presentation/pages/dashboard/search/search_selector.dart';
import 'package:uq_system_app/presentation/pages/dashboard/search/search_state.dart';
import 'package:uq_system_app/presentation/pages/dashboard/search/widgets/search_item.dart';
import 'package:uq_system_app/presentation/widgets/dashboard_app_bar.dart';

import '../../../../core/languages/translation_keys.g.dart';

@RoutePage()
class DashBoardSearchPage extends StatefulWidget {
  @override
  State<DashBoardSearchPage> createState() => _DashBoardSearchPageState();
}

class _DashBoardSearchPageState extends State<DashBoardSearchPage> {
  final SearchBloc _bloc = getIt.get<SearchBloc>();
  List<PartnerResponse> partners = [];
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  void _onRefresh() async {
    _bloc.add(const SearchLoad());
  }

  void _onLoadMore() async {
    _bloc.add(const SearchLoadMore());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        appBar: DashBoardAppBar(
          title: context.tr(LocaleKeys.Dashboard_Search),
          rightIcPath: Assets.icons.svg.icDashboardSearch.path,
        ),
        body: SearchStatusListener(
            statuses: const [SearchStatus.loading, SearchStatus.success],
            listener: (BuildContext context, SearchState state) {
              setState(() {
                if (state.status == SearchStatus.success) {
                  partners = state.partners;
                }
              });
            },
            child: Scrollbar(
              controller: scrollController,
              child: SmartRefresher(
                onRefresh: _onRefresh,
                onLoading: _onLoadMore,
                enablePullDown: true,
                enablePullUp: true,
                controller: _bloc.refreshController,
                child: ListView.builder(
                  itemCount: partners.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(top: index == 0 ? 10 : 0),
                    child: SearchItem(partner:partners[index]),
                  ),
                ),
              ),
            )),
      ),
    );
  }

}
