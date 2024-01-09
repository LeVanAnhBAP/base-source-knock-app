import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:uq_system_app/core/extensions/theme.dart';

import '../../assets.gen.dart';

enum SearchScreenItemIsDone { done, notDone }

class SearchScreenItem extends StatefulWidget {
  final SearchScreenItemIsDone isDone;
  final String introduction;
  final String title;
  final String location;
  final String job;
  final String employees;

  const SearchScreenItem({
    required this.isDone,
    required this.title,
    required this.introduction,
    required this.location,
    required this.job,
    required this.employees,
  });
  @override
  State<StatefulWidget> createState() => _SearchScreenItemState();
}

class _SearchScreenItemState extends State<SearchScreenItem> {
  @override
  Widget build(BuildContext context) {
    final Color iconBorderColor = widget.isDone == SearchScreenItemIsDone.done
        ? context.colors.border
        : context.colors.background;
    final String icon = widget.isDone == SearchScreenItemIsDone.done
        ? Assets.icons.png.pinkTiger.path
        : Assets.icons.png.yellowTiger.path;
    final bool markIsDone =
        widget.isDone == SearchScreenItemIsDone.done ? true : false;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: 200,
          decoration: BoxDecoration(color: context.colors.background),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 28,
                    width: 100,
                    child: Visibility(
                      visible: markIsDone,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            color: context.colors.primarySwatch),
                        child: Center(
                          child: Text(
                            'Knock済み',
                            style: TextStyle(
                              color: context.colors.background,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: iconBorderColor, width: 2)),
                    child: Image.asset(icon),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.title),
                        SvgPicture.asset(Assets.icons.svg.icMark.path)
                      ],
                    ),
                    Text(
                      widget.introduction,
                      style: const TextStyle(fontSize: 11),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(Assets.icons.svg.icRedPin.path),
                            const Gap(4),
                            Text(
                              widget.location,
                              style: const TextStyle(fontSize: 11),
                            )
                          ],
                        ),
                        const Gap(8),
                        Row(
                          children: [
                            SvgPicture.asset(Assets.icons.svg.icJob.path),
                            const Gap(4),
                            Text(
                              widget.job,
                              style: const TextStyle(fontSize: 11),
                            )
                          ],
                        ),
                        const Gap(8),
                        Row(
                          children: [
                            SvgPicture.asset(Assets.icons.svg.icEmployees.path),
                            const Gap(4),
                            Text(
                              widget.employees,
                              style: const TextStyle(fontSize: 11),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        const Gap(2),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          height: 80,
          decoration: BoxDecoration(
            color: context.colors.background,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}
