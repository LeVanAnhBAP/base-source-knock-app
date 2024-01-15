import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/presentation/widgets/back_button_app_bar.dart';
import 'package:uq_system_app/presentation/widgets/input_field.dart';

import '../../../../assets.gen.dart';

@RoutePage()
class SiteDetailsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SiteDetailsState();
}

class _SiteDetailsState extends State<SiteDetailsPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    if (_tabController == null) {
      return const CircularProgressIndicator();
    }
    return Scaffold(
      appBar: const BackAppBar(
        title: '現場詳細情報',
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                color: context.colors.background,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  color: context.colors.primary,
                  width: 2,
                ),
              ),
              child: const Center(
                child: Text('発注現場'),
              ),
            ),
            const Gap(16),
            Flexible(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      height: 40,
                      width: 300,
                      decoration: BoxDecoration(
                          color: context.colors.background,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(24))),
                      child: TabBar(
                        indicator: BoxDecoration(
                            color: context.colors.backgroundDark,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(24))),
                        labelStyle: TextStyle(color: context.colors.background),
                        unselectedLabelStyle:
                            TextStyle(color: context.colors.backgroundDark),
                        controller: _tabController,
                        tabs: const [
                          Tab(text: '現場詳細'),
                          Tab(text: '画像'),
                        ],
                      ),
                    ),
                    const Gap(16),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                top: 20, left: 16, right: 16),
                            color: context.colors.background,
                            child: ListView(
                              children: [
                                const Text('注文No'),
                                InputField(
                                    textFieldHintText: '0031',
                                    controller: TextEditingController()),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('担当者'),
                                    Column(
                                      children: [
                                        Text('不動産　太郎'),
                                        Row(
                                          children: [
                                            Text('不動産　二郎'),
                                            IconButton(
                                                onPressed: () {},
                                                icon: SvgPicture.asset(Assets
                                                    .icons.svg.icRemove.path))
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Center(
                            child: Text('Content for Tab 2'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: context.colors.background,
        height: MediaQuery.of(context).size.height / 9,
        child: Row(
          children: [
            Expanded(
              child: button(
                  backgroundColor: context.colors.background,
                  borderColor: context.colors.border,
                  textColor: context.colors.border,
                  text: '保存'),
            ),
            const Gap(16),
            Expanded(
              child: button(
                  backgroundColor: context.colors.secondary,
                  borderColor: context.colors.secondary,
                  textColor: context.colors.background,
                  text: '登録'),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  button(
      {required Color backgroundColor,
      required Color borderColor,
      required Color textColor,
      required String text}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 14,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              textStyle: TextStyle(color: textColor, fontSize: 20),
              side: BorderSide(color: borderColor, width: 4),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              padding: EdgeInsets.zero),
          onPressed: () {},
          child: Text(
            text,
            style: TextStyle(color: textColor),
          )),
    );
  }
}
