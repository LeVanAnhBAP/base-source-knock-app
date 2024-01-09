import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uq_system_app/presentation/widgets/back_button_app_bar.dart';
@RoutePage()
class NegotiationRoomPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_NegotiationRoomState();

}

class _NegotiationRoomState extends State<NegotiationRoomPage>{
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar:BackAppBar(title: '交渉ルーム',),
    );
  }

}