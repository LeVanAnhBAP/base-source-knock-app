import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uq_system_app/core/extensions/theme.dart';

import '../../assets.gen.dart';
class DropdownAddress extends StatefulWidget {
  final List<String> list;
  final String dropdownValue;
  final Function(String?) onChanged;
   const DropdownAddress({
    required this.list,
     required this.dropdownValue,
     required this.onChanged
  });

  @override
  State<StatefulWidget> createState() => _DropdownAddressState();
}

class _DropdownAddressState extends State<DropdownAddress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      padding: const EdgeInsets.only(left: 16,top: 4,right: 16),
      height: 60,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: const Color.fromRGBO(247, 248, 250, 1),
        border: Border.all(color: context.colors.background, width: 2),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 2,
            spreadRadius: 2,
          ),
        ],
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        icon: SvgPicture.asset(Assets.icons.svg.icDropdown.path),
        value: widget.dropdownValue,
        elevation: 0,
        style: const TextStyle(color: Colors.deepPurple),
        onChanged: widget.onChanged,
        items: widget.list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(color: context.colors.border
                  ,fontSize: 18),
            ),
          );
        }).toList(),
        menuMaxHeight: 400,
        underline: Container(
          height: 0,
          color: Colors.transparent,
        ),
      ),
    );
  }
}
