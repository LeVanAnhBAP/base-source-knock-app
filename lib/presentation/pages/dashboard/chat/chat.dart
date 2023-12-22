import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
@RoutePage()
class DashboardChatPage extends StatefulWidget{
  const DashboardChatPage({super.key});
  @override
  State<DashboardChatPage> createState() =>_DashboardChatPageState();

}

class _DashboardChatPageState extends State<DashboardChatPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('chat'),
    );
  }
}