import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/data/models/response/occupation_major_response.dart';
import 'package:uq_system_app/data/models/response/occupation_response.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/occupation/occupation_bloc.dart';
import 'package:uq_system_app/presentation/pages/occupation/occupation_event.dart';
import 'package:uq_system_app/presentation/pages/occupation/occupation_selector.dart';
import 'package:uq_system_app/presentation/widgets/base_app_bar.dart';
import 'package:uq_system_app/presentation/widgets/divider_line.dart';

import '../../../core/languages/translation_keys.g.dart';
import '../../widgets/search_field.dart';

@RoutePage()
class OccupationPage extends StatefulWidget {
  final List<OccupationMajorResponse> occupations;
  final OccupationResponse? selectedOccupation;

  const OccupationPage(this.occupations, this.selectedOccupation);

  @override
  State<OccupationPage> createState() => _OccupationPageState();
}

class _OccupationPageState extends State<OccupationPage> {
  final OccupationBloc _bloc = getIt.get<OccupationBloc>();
  final List<ValueNotifier<bool>> _isExpandedNotifiers = [];
  final ValueNotifier<OccupationResponse?> selectedOccupation =
      ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      _bloc.add(OccupationEvent.receiveData(occupations: widget.occupations));
    });
    selectedOccupation.value = widget.selectedOccupation;
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
          titleText: context.tr(LocaleKeys.Occupation_Occupation),
          leftIcPath: Assets.icons.svg.icClose.path,
        ),
        body: PopScope(
          canPop: false,
          onPopInvoked: (value) {
            Navigator.pop(context, selectedOccupation.value);
          },
          child: Column(
            children: [
              Divider(
                height: 1,
                color: context.colors.divider,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: SearchField(
                  onSearchValue: (value) {
                    _bloc.add(OccupationEvent.search(
                        searchText: value.toLowerCase()));
                  },
                  placeholder: context.tr(LocaleKeys.Occupation_JobTitleSearch),
                ),
              ),
              OccupationSelector(
                builder: (data) => Expanded(
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) =>
                            _buildOccupationItem(data[index], index))),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOccupationItem(
      OccupationMajorResponse occupationMajor, int index) {
    if (_isExpandedNotifiers.length <= index) {
      _isExpandedNotifiers.add(ValueNotifier<bool>(false));
    } else {
      _isExpandedNotifiers[index].value = false;
    }
    return Column(
      children: [
        Divider(
          height: 1,
          color: context.colors.divider,
        ),
        ExpansionTile(
          onExpansionChanged: (value) {
            _isExpandedNotifiers[index].value = value;
          },
          trailing: AnimatedBuilder(
            animation: _isExpandedNotifiers[index],
            builder: (context, child) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                child: _isExpandedNotifiers[index].value
                    ? const Icon(
                        Icons.keyboard_arrow_up,
                        size: 30,
                      ) // Icon when expanded
                    : const Icon(Icons.keyboard_arrow_down,
                        size: 30), // Icon when collapsed
              );
            },
          ),
          tilePadding: const EdgeInsets.symmetric(horizontal: 20),
          title: Text(
            occupationMajor.name,
            style: context.typographies.bodyBold,
          ),
          collapsedTextColor: Colors.black,
          textColor: Colors.black,
          iconColor: Colors.black,
          collapsedIconColor: Colors.black,
          children: occupationMajor.subItems
                  ?.map((e) => _buildOccupationSubItem(e))
                  .toList() ??
              [],
        )
      ],
    );
  }

  Widget _buildOccupationSubItem(OccupationResponse occupation) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DividerLine(),
        InkWell(
          onTap: () {
            selectedOccupation.value = occupation;
          },
          child: ValueListenableBuilder(
            builder: (context, data, child) {
              return Container(
                width: MediaQuery.of(context).size.width,
                color: data?.occMajorItemId == occupation.occMajorItemId &&
                        data?.id == occupation.id
                    ? const Color(0xFFFDE50B)
                    : Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                child: Text(
                  occupation.name,
                  style: context.typographies.bodyBold,
                ),
              );
            },
            valueListenable: selectedOccupation,
          ),
        ),
      ],
    );
  }
}
