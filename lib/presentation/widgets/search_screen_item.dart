import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:uq_system_app/core/extensions/theme.dart';

import '../../assets.gen.dart';


class SearchScreenItem extends StatefulWidget {
  final String icon;
  final String introduction;
  final String title;
  final String location;
  final String job;
  final String employees;

  const SearchScreenItem({
    required this.icon,
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

    return Column(
      children: [
        item(),
        const Gap(2),
        calendar(),
      ],
    );

  }

  calendar() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 72,
      decoration: BoxDecoration(
        color: context.colors.background,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    );
  }
  item() {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 180,
      decoration: BoxDecoration(color: context.colors.background),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Image.asset(widget.icon),
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
    );
  }

}
