import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/core/languages/translation_keys.g.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/domain/entities/member.dart';
import 'package:uq_system_app/presentation/pages/search_member/search_member_bloc.dart';
import 'package:uq_system_app/presentation/pages/search_member/search_member_event.dart';
import 'package:uq_system_app/presentation/pages/search_member/search_member_selector.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../widgets/base_app_bar.dart';
import '../../widgets/search_field.dart';

@RoutePage()
class SearchMemberPage extends StatefulWidget {
  final List<Member> members;

  const SearchMemberPage(this.members);

  @override
  State<SearchMemberPage> createState() => _SearchMemberPageState();
}

class _SearchMemberPageState extends State<SearchMemberPage> {
  final SearchMemberBloc _bloc = getIt.get<SearchMemberBloc>();
  final int userId = getIt<AuthBloc>().state.account!.id;

  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      _bloc.add(
          SearchMemberEvent.receiveData(members: widget.members));
    });
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
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          context,
          appBarTitle: context.tr(LocaleKeys.SearchMember_PersonInChargeSearch),
        ),
        body: PopScope(
          canPop: false,
          onPopInvoked: (value) {
            Navigator.pop(context, _bloc.state.members);
          },
          child: Column(
            children: [
              Divider(
                height: 1,
                color: context.colors.divider,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: SearchField(
                  onSearchValue: (value) {
                    _bloc.add(SearchMemberEvent.search(
                        searchText: value.toLowerCase(),
                      ));
                  },
                  placeholder: context.tr(LocaleKeys.SearchMember_PersonNameSearch),
                ),
              ),
              if (_bloc.state.members.isNotEmpty) ...[
                Divider(
                  height: 1,
                  color: context.colors.divider,
                )
              ],
              SearchMemberStatusSelector(
                builder: (status) => Expanded(
                    child: ListView.builder(
                  itemCount: _bloc.state.members.length,
                  itemBuilder: (context, index) =>
                      _buildSearchItem(_bloc.state.members[index]),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchItem(Member member) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            if(member.id == userId || member.roleId == 1) return;
            _bloc.add(SearchMemberEvent.changeSelection(memberId: member.id));
          },
          child: Container(
            color: member.id == userId || member.roleId == 1
                ? const Color(0xFFF5F5F5)
                : member.isSelected
                    ? const Color(0xFFFDE50B)
                    : Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      member.firstNameKana ?? "",
                      style: context.typographies.subBody1.withSize(10),
                    ),
                    Text(
                      member.firstName ?? "",
                      style: context.typographies.bodyBold,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      member.lastNameKana ?? "",
                      style: context.typographies.subBody1.withSize(8),
                    ),
                    Text(
                      member.lastName ?? "",
                      style: context.typographies.bodyBold,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Divider(
          height: 1,
          color: context.colors.divider,
        )
      ],
    );
  }
}
