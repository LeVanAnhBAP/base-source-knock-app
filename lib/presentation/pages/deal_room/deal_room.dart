import 'dart:async';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/deal_room/deal_room_bloc.dart';
import 'package:uq_system_app/presentation/pages/deal_room/deal_room_event.dart';
import 'package:uq_system_app/presentation/pages/deal_room/deal_room_selector.dart';
import 'package:uq_system_app/presentation/pages/deal_room/widgets/deal_room_item.dart';
import 'package:uq_system_app/presentation/widgets/base_app_bar.dart';

import '../../../assets.gen.dart';

@RoutePage()
class DealRoomPage extends StatefulWidget {
  @override
  State<DealRoomPage> createState() => _DealRoomPageState();
}

class _DealRoomPageState extends State<DealRoomPage> {
  final DealRoomBloc _bloc = getIt.get<DealRoomBloc>();
  Timer? searchOnStoppedTyping;
  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      _bloc.add(const DealRoomEvent.load());
    });
  }
  @override
  void dispose() {
    _bloc.close();

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
            () => _bloc.add(DealRoomEvent.search(name: value))));
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        appBar: CustomAppBar(
          context,
          titleText: '交渉ルーム',
        ),
        body: Column(
          children: [
            _buildSearch(),
            Expanded(child: _buildBody())
          ],
        ),
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
                onChanged: _onTextChangedHandler,
                style: context.typographies.subBody2,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  enabledBorder: InputBorder.none,
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  hintText: "会社名検索",
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
  void _onLoading() async {
    _bloc.add(const DealRoomEvent.loadMore());
  }

  Widget _buildBody() {
    return SmartRefresher(
      enablePullDown: false,
      enablePullUp: true,
      onLoading: _onLoading,
      controller: _bloc.refreshController,
      child: DealRoomSelector(
        builder: (data) {
          return ListView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            physics: const  NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => DealRoomItem(data[index]),
          );
        }, selector: ( state) => state.dealRooms,
      ),
    );
  }
}
