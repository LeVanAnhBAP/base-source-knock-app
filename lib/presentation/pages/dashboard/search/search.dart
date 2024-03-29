import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/presentation/navigation/navigation.dart';
import 'package:uq_system_app/presentation/pages/dashboard/search/search_bloc.dart';
import 'package:uq_system_app/presentation/pages/dashboard/search/search_event.dart';
import 'package:uq_system_app/presentation/pages/dashboard/search/search_state.dart';
import 'package:uq_system_app/presentation/widgets/app_bar.dart';
import 'package:uq_system_app/presentation/widgets/search_screen_item.dart';
import '../../../../assets.gen.dart';

@RoutePage()
class DashboardSearchPage extends StatelessWidget {
  const DashboardSearchPage({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(),
      child: const _DashboardSearchPageContent(),
    );
  }
}

class _DashboardSearchPageContent extends StatefulWidget {

  const _DashboardSearchPageContent({Key? key})
      : super(key: key);

  @override
  State<_DashboardSearchPageContent> createState() =>
      _DashboardSearchPageContentState();
}

class _DashboardSearchPageContentState
    extends State<_DashboardSearchPageContent> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    context
        .read<SearchBloc>()
        .add(const DashboardSearchGetDataStarted());
    super.initState();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      context
          .read<SearchBloc>()
          .add(const DashboardSearchLoadMoreData());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        title: '探す',
        openDrawer: () {},
        rightButtonIcon: Assets.icons.svg.icDashboardSearch.path,
        isVisibleDrawer: false,
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<SearchBloc>().add(
            const DashboardSearchGetDataStarted());
      },
      child: Container(
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if (state.status == SearchStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status == SearchStatus.success) {
              List<dynamic>? listPartner = state.listPartner;
              if (listPartner != null && listPartner.isNotEmpty) {
                return Scrollbar(
                  thickness: 8,
                  thumbVisibility: true,
                  controller: _scrollController,
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: listPartner.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SearchScreenItem(
                        companyName: listPartner[index]['name'] ?? 'null',
                        introduction: listPartner[index]['intro'] ?? '情報未入力',
                        location: (listPartner[index]['work_areas'] ?? [])
                                .isEmpty
                            ? '情報未入力'
                            : '${listPartner[index]['work_areas'][0]['name']}',
                        occupation: (listPartner[index]['occupation_sub_item'] ?? [])
                                .isEmpty
                            ? '情報未入力'
                            : '${listPartner[index]['occupation_sub_item'][0]['name']}',
                        manNumber:
                            '稼働可能人員目安 ${listPartner[index]['man_number'] ?? '0'}人',
                        logo: (listPartner[index]['logo']['url']).toString(),
                        onClick: () { 
                          context.router.push(const DetailPartnerRoute());
                        },
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
      ),
    );
  }
}
