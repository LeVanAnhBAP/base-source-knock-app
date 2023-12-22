import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:uq_system_app/core/extensions/theme.dart';

import '../../assets.gen.dart';

class ScheduleCard extends StatefulWidget {
  final String title;
  final String location;
  final DateTime dayFrom;
  final DateTime dayTo;
  final String company;
  final String companyLogo;
  final Function() clickDropRight;
  const ScheduleCard(
      {required this.title,
      required this.location,
      required this.dayFrom,
      required this.dayTo,
      required this.company,
      required this.companyLogo,
      required this.clickDropRight});
  @override
  State<StatefulWidget> createState() => _ScheduleCardState();
}

class _ScheduleCardState extends State<ScheduleCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 40,
          decoration: BoxDecoration(
              color: context.colors.information,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                Assets.icons.svg.icScheduleCard.path,
                height: 32,
              ),
              Container(
                height: 28,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: context.colors.background),
                child: const Center(child: Text('不動産　太郎')),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
          height: 160,
          decoration: BoxDecoration(
              color: context.colors.background,
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16))),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.title,
                  style: const TextStyle(fontSize: 22),
                ),
              ),
              const Gap(20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                                Assets.icons.svg.icScheduleCardLocation.path),
                            const Gap(4),
                            Text(widget.location),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                                Assets.icons.svg.icScheduleCardCalendar.path),
                            const Gap(4),
                            Text(
                                '${DateFormat('yyyy/MM/dd(E)').format(widget.dayFrom)} ~ ${DateFormat('yyyy/MM/dd(E)').format(widget.dayTo)}')
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(widget.companyLogo),
                            const Gap(8),
                            Text(widget.company)
                          ],
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: widget.clickDropRight,
                        child: SvgPicture.asset(
                          Assets.icons.svg.icScheduleArrowDropright.path,
                          height: 32,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
