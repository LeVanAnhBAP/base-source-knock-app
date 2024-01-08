import 'dart:async';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/data/models/response/partner_response.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/dashboard/search/search_bloc.dart';
import 'package:uq_system_app/presentation/pages/dashboard/search/search_event.dart';
import 'package:uq_system_app/presentation/pages/dashboard/search/search_selector.dart';
import 'package:uq_system_app/presentation/pages/dashboard/search/search_state.dart';
import 'package:uq_system_app/presentation/pages/dashboard/search/widgets/search_item.dart';
import 'package:uq_system_app/presentation/widgets/dashboard_app_bar.dart';

@RoutePage()
class DashBoardSearchPage extends StatefulWidget {
  @override
  State<DashBoardSearchPage> createState() => _DashBoardSearchPageState();
}

class _DashBoardSearchPageState extends State<DashBoardSearchPage> {
  final SearchBloc _bloc = getIt.get<SearchBloc>();
  ScrollController controller = ScrollController();
  List<PartnerResponse> partners = [];
  @override
  void initState() {
    scheduleMicrotask(() {
      _bloc.add(const SearchEvent.load());
    });
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
        appBar: DashBoardAppBar(
          title: "探す",
          rightIcPath: Assets.icons.svg.icDashboardSearch.path,
        ),
        body: SearchStatusListener(
            statuses: const [SearchStatus.loading, SearchStatus.success],
            listener: (BuildContext context, SearchState state) {
              setState(() {
                if (state.status == SearchStatus.loading) {
                  partners.clear();
                } else {
                  partners.addAll(state.partners);
                }
              });
            },
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(child: _buildList()),
              ],
            )),
      ),
    );
  }

  Widget _buildList() {
    return SearchStatusSelector(builder: (status) {
      if (status == SearchStatus.success ||
          status == SearchStatus.loadingMore) {
        return ListView.builder(
          itemCount: status == SearchStatus.loadingMore
              ? partners.length
              : partners.length + 1,
          controller: controller
            ..addListener(() {
              if (controller.position.pixels ==
                      controller.position.maxScrollExtent &&
                  status != SearchStatus.loadingMore) {
                scheduleMicrotask(() {
                  _bloc.add(const SearchLoadMore());
                });
              }
            }),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            if (index < partners.length) {
              return SearchItem(partner: partners[index]);
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: CircularProgressIndicator(
                    color: context.colors.secondary,
                  ),
                ),
              );
            }
          },
        );
      }
      return Container();
    });
  }
}
