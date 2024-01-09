import 'dart:async';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/data/models/response/account.dart';
import 'package:uq_system_app/data/models/response/site_response.dart';
import 'package:uq_system_app/data/sources/local/local.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/dashboard/widgets/site_item.dart';
import 'package:uq_system_app/presentation/pages/dashboard/on_site/on_site_bloc.dart';
import 'package:uq_system_app/presentation/pages/dashboard/on_site/on_site_event.dart';
import 'package:uq_system_app/presentation/pages/dashboard/on_site/on_site_selector.dart';
import 'package:uq_system_app/presentation/pages/dashboard/on_site/on_site_state.dart';
import 'package:uq_system_app/presentation/pages/dashboard/widgets/site_skeleton.dart';
import 'package:uq_system_app/presentation/widgets/dashboard_app_bar.dart';

@RoutePage()
class DashBoardOnSitePage extends StatefulWidget {
  @override
  State<DashBoardOnSitePage> createState() => _DashBoardOnSitePageState();
}

class _DashBoardOnSitePageState extends State<DashBoardOnSitePage> {
  final OnSiteBloc _bloc = getIt.get<OnSiteBloc>();
  ScrollController controller = ScrollController();
  final LocalDataSource _localDataSource = getIt.get<LocalDataSource>();
  List<SiteResponse> sites = [];
  Timer? searchOnStoppedTyping;
  @override
  void initState() {
    scheduleMicrotask(() {
      _bloc.add(const OnSiteEvent.onLoad());
    });
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    searchOnStoppedTyping?.cancel();
    super.dispose();
  }

  _onTextChangedHandler(value) {
    if (searchOnStoppedTyping != null) {
      setState(() {
        searchOnStoppedTyping?.cancel();
      });
    }
    setState(() => searchOnStoppedTyping = Timer(
        const Duration(milliseconds: 200),
        () => _bloc.add(OnSiteEvent.onSearch(value))));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: FutureBuilder<Account?>(
        future: _localDataSource.getAccount(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var account = snapshot.data;
            return Scaffold(
              appBar: DashBoardAppBar(
                title: "現場",
                leftIcPath: Assets.icons.svg.icMenu.path,
                rightIcPath: (account?.role == 1 || account?.role == 2) &&
                        account?.company.type == 1
                    ? Assets.icons.svg.icDashboardOnsite.path
                    : null,
                rightIcDescription: "新規登録",
              ),
              body: OnSiteStatusListener(
                statuses: const [OnSiteStatus.success, OnSiteStatus.loading],
                listener: (BuildContext context, OnSiteState state) {
                  setState(() {
                    if (state.status == OnSiteStatus.loading) {
                      sites.clear();
                    } else {
                      sites.addAll(state.sites);
                    }
                  });
                },
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    _buildSearch(),
                    Expanded(
                      child: _buildList(account),
                    )
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: Row(
          children: [
            SvgPicture.asset(
              Assets.icons.svg.icSearch.path,
              width: 15,
              height: 15,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextField(
                style: context.typographies.subBody2,
                onChanged: _onTextChangedHandler,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  enabledBorder: InputBorder.none,
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  hintText: "現場名検索",
                  hintStyle: context.typographies.subBody2
                      .withColor(context.colors.primary.withOpacity(0.5)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onRefresh() async {
    _bloc.add(const OnSiteEvent.onLoad(isRefresh: true));
  }

  void _onLoading() async {
    Future.delayed(const Duration(milliseconds: 500), (){
 _bloc.add(const OnSiteEvent.onLoadMore());
    });
  }

  Widget _buildList(Account? account) {
    return OnSiteStatusSelector(builder: (status) {
      if (status == OnSiteStatus.loading) {
        return ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => const SiteSkeletion(),
        );
      }
      return SmartRefresher(
        controller: _bloc.refreshController,
        enablePullDown:  status != OnSiteStatus.loadingMore,
        enablePullUp: status != OnSiteStatus.loadingMore,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.builder(
          itemCount: sites.length,
          itemBuilder: (context, index) {
            return SiteItem(
              site: sites[index],
              companyType: account?.company.type ?? 1,
            );
          },
        ),
      );
    });
  }
}
