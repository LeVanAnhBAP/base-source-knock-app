import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
@RoutePage()
class DashboardSearchPage extends StatefulWidget{
  const DashboardSearchPage({super.key});
  @override
  State<DashboardSearchPage> createState() =>_DashboardSearchPageState();

}

class _DashboardSearchPageState extends State<DashboardSearchPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('search'),
    );
  }
}