import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/data/models/response/common_item_response.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/navigation/navigation.dart';
import 'package:uq_system_app/presentation/pages/order_details/order_details_bloc.dart';
import 'package:uq_system_app/presentation/widgets/base_app_bar.dart';
import 'package:uq_system_app/presentation/widgets/divider_line.dart';

import '../../../core/languages/translation_keys.g.dart';
import '../../widgets/input_container.dart';

@RoutePage()
class OrderDetailsPage extends StatefulWidget {
  final List<CommonItemResponse> units;

  const OrderDetailsPage(this.units);

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  final OrderDetailsBloc _bloc = getIt.get<OrderDetailsBloc>();

  @override
  void dispose() {
    _bloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(context,
            appBarTitle: context.tr(LocaleKeys.OrderDetails_OrderDetails)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const DividerLine(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextBlock(
                        title: context
                            .tr(LocaleKeys.OrderDetails_ConstructionName),
                        content: ""),
                    _buildTextBlock(
                        title: context.tr(LocaleKeys
                            .OrderDetails_TotalOrderAmountTaxIncluded),
                        content: ""),
                    _buildTextBlock(
                        title: context.tr(LocaleKeys
                            .OrderDetails_ConstructionCostExcludingTax),
                        content: ""),
                    _buildTextBlock(
                        title:
                            context.tr(LocaleKeys.OrderDetails_ConsumptionTax),
                        content: ""),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      context.tr(LocaleKeys.OrderDetails_OrderDetails),
                      style: context.typographies.subBodyBold1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildOrderDetailsTable()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextBlock({required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: context.typographies.subBodyBold1,
        ),
        const SizedBox(
          height: 5,
        ),
        InputContainer(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            width: MediaQuery.of(context).size.width,
            backgroundColor: context.colors.disabled,
            child: Text(
              content,
              style: context.typographies.subBodyBold1
                  .withColor(context.colors.primary),
            )),
      ],
    );
  }

  Widget _buildOrderDetailsTable() {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            Flexible(
              flex: 6,
              child: Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    context.tr(LocaleKeys.OrderDetails_Name),
                    style: context.typographies.subBodyBold1,
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 3,
              child: Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    context.tr(LocaleKeys.OrderDetails_AmountOfMoney),
                    style: context.typographies.subBodyBold1,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
              color: context.colors.secondary,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15))),
          child: Container(
            margin: const EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: context.colors.divider,
                width: 2,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 9,
                  itemBuilder: (context, index) => Column(
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Flexible(
                              flex: 6,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      context
                                          .tr(LocaleKeys.OrderDetails_AddRow),
                                      style: context.typographies.subBodyBold1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              child: Row(
                                children: [
                                  Container(
                                    width: 2,
                                    color: context.colors.divider,
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    context.tr(LocaleKeys.OrderDetails_AddRow),
                                    style: context.typographies.subBodyBold1,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const DividerLine(),
                    ],
                  ),
                ),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Flexible(
                        flex: 6,
                        child: InkWell(
                          onTap: () {
                            context.router
                                .push(OrderLineRoute(units: widget.units));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 30,
                                ),
                                SvgPicture.asset(Assets.icons.svg.icPlus.path),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  context.tr(LocaleKeys.OrderDetails_AddRow),
                                  style: context.typographies.subBodyBold1
                                      .withColor(context.colors.tertiary),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Row(
                          children: [
                            Container(
                              width: 2,
                              color: context.colors.divider,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
