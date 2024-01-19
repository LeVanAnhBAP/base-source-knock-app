import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:uq_system_app/presentation/widgets/app_bar.dart';
import 'package:uq_system_app/presentation/widgets/search_screen_item.dart';
import '../../../../assets.gen.dart';

@RoutePage()
class DashboardSearchPage extends StatefulWidget {
  const DashboardSearchPage({super.key});
  @override
  State<DashboardSearchPage> createState() => _DashboardSearchPageState();
}

class _DashboardSearchPageState extends State<DashboardSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        title: '探す',
        openDrawer: () {},
        rightButtonIcon: Assets.icons.svg.icDashboardSearch.path,
        isVisibleDrawer: false,
      ),
      body: SingleChildScrollView(
        child: buildContent(),
      ),
    );
  }

  Widget buildContent() {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
        left: 20,
        right: 20,
      ),
      child: Column(
        children: [
          SearchScreenItem(
            title: '内装職人Knock',
            introduction: 'はじめまして。内装工事を専門に行なっている職人インテリアと言います。よろしくお願いいたします。',
            location: '東京都 / 埼玉県 / 神奈川県',
            job: 'インテリア工事 / 天井仕上げ工事',
            employees: '稼働可能人員目安　3人',
            icon: Assets.icons.png.pinkTiger.path,
          ),
          SearchScreenItem(
            title: '防水職人Knock',
            introduction: 'はじめまして。内装工事を専門に行なっているAPOリフォームと言います。よろしくお願いいたします。',
            location: '東京都 / 埼玉県 / 神奈川県',
            job: 'インテリア工事 / 天井仕上げ工事',
            employees: '稼働可能人員目安　3人',
            icon: Assets.icons.png.pinkTiger.path,
          ),
          SearchScreenItem(
            title: '防水職人Knock',
            introduction: 'はじめまして。内装工事を専門に行なっているAPOリフォームと言います。よろしくお願いいたします。',
            location: '東京都 / 埼玉県 / 神奈川県',
            job: 'インテリア工事 / 天井仕上げ工事',
            employees: '稼働可能人員目安　3人',
            icon: Assets.icons.png.pinkTiger.path,
          ),
        ],
      ),
    );
  }
}
