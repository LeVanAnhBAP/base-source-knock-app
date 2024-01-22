import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/data/models/request/price_order_detail_params.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/order_line/order_line_bloc.dart';
import 'package:uq_system_app/presentation/pages/order_line/order_line_event.dart';
import 'package:uq_system_app/presentation/pages/order_line/order_line_selector.dart';
import 'package:uq_system_app/presentation/widgets/divider_line.dart';
import 'package:uq_system_app/presentation/widgets/main_text_field.dart';

import '../../../core/languages/translation_keys.g.dart';
import '../../../data/models/response/common_item_response.dart';
import '../../widgets/base_app_bar.dart';
import '../../widgets/droplist_input_item.dart';
import '../../widgets/input_container.dart';

@RoutePage()
class OrderLinePage extends StatefulWidget {
  final List<CommonItemResponse> units;

  const OrderLinePage(this.units);

  @override
  State<OrderLinePage> createState() => _OrderLinePageState();
}

class _OrderLinePageState extends State<OrderLinePage> {
  final OrderLineBloc _bloc = getIt.get<OrderLineBloc>();
  final TextEditingController _priceUnitController = TextEditingController();
  String _formatNumber(String s) =>
      NumberFormat.decimalPattern('en').format(int.parse(s));

  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      _bloc.add(OrderLineUpdateParams(
          prams: PriceOrderDetailParams(unit: widget.units[0].id)));
    });
  }

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
            appBarTitle: context.tr(LocaleKeys.OrderLine_OrderLine)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const DividerLine(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextFieldBlock(
                    title: context.tr(LocaleKeys.OrderLine_Name),
                  ),
                  _buildTextFieldBlock(
                    title:
                        context.tr(LocaleKeys.OrderLine_SpecificationsSummary),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildTextFieldBlock(
                                  title:
                                      context.tr(LocaleKeys.OrderLine_Quantity),
                                  padding: EdgeInsets.zero,
                                  hint: "0",
                                  textInputType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                  ],
                              maxLength: 14),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PopupMenuButton(
                                padding: EdgeInsets.zero,
                                surfaceTintColor: Colors.white,
                                itemBuilder: (BuildContext context) => widget
                                    .units
                                    .map((e) => PopupMenuItem(
                                        padding: EdgeInsets.zero,
                                        onTap: () {
                                          _bloc.add(OrderLineUpdateParams(
                                              prams: _bloc.state.params
                                                  .copyWith(unit: e.id)));
                                        },
                                        height: 30,
                                        value: e,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 20),
                                          child: Text(
                                            e.name,
                                            style:
                                                context.typographies.bodyBold,
                                          ),
                                        )))
                                    .toList(),
                                child: OrderLineSelector(
                                  builder: (data) {
                                    return DropListInputItem(
                                        title: context
                                            .tr(LocaleKeys.OrderLine_Unit),
                                        content: data != null
                                            ? widget.units
                                                .firstWhere((element) =>
                                                    element.id == data)
                                                .name
                                            : "");
                                  },
                                  selector: (state) => state.params.unit,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                      ],
                    ),
                  ),
                  _buildTextFieldBlock(
                      controller: _priceUnitController,
                      title: context
                          .tr(LocaleKeys.OrderLine_UnitPriceExcludingTax),
                      hint: "¥0",
                      textInputType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ]),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      context.tr(LocaleKeys.OrderLine_AmountExcludingTax),
                      style: context.typographies.subBodyBold1,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: InputContainer(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        width: MediaQuery.of(context).size.width,
                        backgroundColor: context.colors.disabled,
                        child: Text(
                          "¥0",
                          style: context.typographies.bodyBold
                              .withColor(context.colors.primary),
                        )),
                  ),
                  _buildBottomActions(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldBlock(
      {TextEditingController? controller,
      required String title,
      String? hint,
      padding = const EdgeInsets.symmetric(horizontal: 15),
      TextInputType? textInputType,
      List<TextInputFormatter>? inputFormatters,
      int? maxLength}) {
    return Padding(
      padding: padding,
      child: Column(
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
          MainTextField(
            controller: controller,
            onTapOutside: (PointerDownEvent e) {
              var string = '¥${_formatNumber(controller?.value.text ?? "0")}';
              controller?.value = TextEditingValue(
                text: string,
              );
            },
            hintText: hint,
            textInputType: textInputType,
            inputFormatters: inputFormatters,
            maxLength: maxLength,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  surfaceTintColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 3, color: Color(0xFFD45336)),
                      borderRadius: BorderRadius.circular(10))),
              child: Text(
                context.tr(LocaleKeys.OrderLine_Delete),
                style: context.typographies.bodyBold
                    .withColor(const Color(0xFFD45336)),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: context.colors.secondary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Text(
                context.tr(LocaleKeys.OrderLine_Registration),
                style: context.typographies.bodyBold.withColor(Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
