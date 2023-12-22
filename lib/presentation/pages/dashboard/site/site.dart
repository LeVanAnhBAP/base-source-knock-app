import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
@RoutePage()
class DashboardSitePage extends StatefulWidget{
  const DashboardSitePage({super.key});
  @override
  State<DashboardSitePage> createState() =>_DashboardSitePageState();

}

class _DashboardSitePageState extends State<DashboardSitePage>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Text('site'),
   );
  }
}