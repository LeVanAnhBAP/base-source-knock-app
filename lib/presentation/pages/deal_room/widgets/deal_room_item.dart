

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/data/models/response/deal_room_response.dart';
import 'package:badges/badges.dart' as badges;
import 'package:uq_system_app/presentation/navigation/navigation.dart';
class DealRoomItem extends StatelessWidget{
  final DealRoomResponse dealRoom;
  const DealRoomItem(this.dealRoom);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const  EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: InkWell(
        onTap: (){
          context.router.push(const ChatDealRoomRoute());
        },
        child: Container(
          padding: const  EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: (dealRoom.unreadCount ?? -1)  > 0 ? Colors.red :  context.colors.tertiary ,

            )
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: Image.network(dealRoom.companyLogo ?? "", width: 25).image,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(child: Text(
                dealRoom.companyName ?? "",
                style: context.typographies.bodyBold,
                overflow: TextOverflow.ellipsis,
              )),
              const SizedBox(
                width: 10,
              ),
              badges.Badge(
                showBadge: (dealRoom.unreadCount ?? -1) >= 1,
                badgeContent: Text(dealRoom.unreadCount?.toString() ?? ""),
              )
            ],
          ),
        ),
      ),
    );
  }

}