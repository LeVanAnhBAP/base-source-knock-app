import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/data/models/price_order_detail_model.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/order_line/order_line_bloc.dart';
import 'package:uq_system_app/presentation/pages/order_line/order_line_event.dart';
import 'package:uq_system_app/presentation/pages/order_line/order_line_selector.dart';
import 'package:uq_system_app/presentation/widgets/divider_line.dart';
import 'package:uq_system_app/utils/utils.dart';

import '../../../core/languages/translation_keys.g.dart';
import '../../../data/models/response/common_item_response.dart';
import '../../widgets/base_app_bar.dart';
import '../../widgets/droplist_input_item.dart';
import '../../widgets/input_container.dart';

@RoutePage()
class OrderLinePage extends StatefulWidget {
  final PriceOrderDetailModel? params;
  final List<CommonItemResponse> units;

  const OrderLinePage(this.params, this.units);

  @override
  State<OrderLinePage> createState() => _OrderLinePageState();
}

class _OrderLinePageState extends State<OrderLinePage> {
  final OrderLineBloc _bloc = getIt.get<OrderLineBloc>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _specificationsController =
      TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceUnitController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.params != null) {
      _bloc.add(OrderLineUpdateParams(
          prams: widget.params!.copyWith(unit: widget.units[0].id)));
      _nameController.text = widget.params!.name!;
      _specificationsController.text = widget.params!.specifications!;
      _quantityController.text = widget.params!.quantity!.toString();
      _priceUnitController.text = "¥${Utils.formatCurrency(widget.params!.priceUnit!.toString())}";
    } else {
      _bloc.add(OrderLineUpdateParams(
          prams: PriceOrderDetailModel(unit: widget.units[0].id)));
    }
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
            titleText: context.tr(LocaleKeys.OrderLine_OrderLine)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const DividerLine(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      context.tr(LocaleKeys.OrderLine_Name),
                      style: context.typographies.subBodyBold1,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: InputContainer(
                        child: TextField(
                      controller: _nameController,
                      onChanged: (value) {
                        _bloc.add(OrderLineUpdateParams(
                            prams: _bloc.state.params.copyWith(
                                name: value.isNotEmpty ? value : null)));
                      },
                    )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      context.tr(LocaleKeys.OrderLine_SpecificationsSummary),
                      style: context.typographies.subBodyBold1,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: InputContainer(
                        child: TextField(
                      controller: _specificationsController,
                      onChanged: (value) {
                        _bloc.add(OrderLineUpdateParams(
                            prams: _bloc.state.params.copyWith(
                                specifications:
                                    value.isNotEmpty ? value : null)));
                      },
                    )),
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
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                context.tr(LocaleKeys.OrderLine_Quantity),
                                style: context.typographies.subBodyBold1,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              InputContainer(
                                  child: TextField(
                                controller: _quantityController,
                                maxLength: 3,
                                onChanged: (value) {
                                  try {
                                    var quantity = int.parse(value);
                                    _bloc.add(OrderLineUpdateQuantity(
                                        quantity: quantity));
                                  } catch (_) {
                                    _bloc.add(const OrderLineUpdateQuantity(
                                        quantity: null));
                                  }
                                },
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  counter: Container(),
                                  hintText: "0",
                                ),
                              ))
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
                        child: TextField(
                            maxLength: 14,
                            controller: _priceUnitController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              counter: Container(),
                              hintText: "¥0",
                            ),
                            onChanged: (value) {
                              try {
                                var price = int.parse(value);
                                _bloc.add(
                                    OrderLineUpdateUnitPrice(unitPrice: price));
                              } catch (_) {
                                _bloc.add(const OrderLineUpdateUnitPrice(
                                    unitPrice: null));
                              }
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            onTapOutside: (PointerDownEvent e) {
                              var string =
                                  '¥${Utils.formatCurrency(_priceUnitController.value.text)}';
                              _priceUnitController.value = TextEditingValue(
                                text: string,
                              );
                            })),
                  ),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: InputContainer(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        width: MediaQuery.of(context).size.width,
                        backgroundColor: context.colors.disabled,
                        child: OrderLineSelector(
                          builder: (data) {
                            return Text(
                              "¥${Utils.formatCurrency(data.toString())}",
                              style: context.typographies.bodyBold
                                  .withColor(context.colors.primary),
                            );
                          },
                          selector: (state) => state.total,
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

  Widget _buildBottomActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                context.router.pop();
              },
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
            child: OrderLineSelector(
              builder: (data) {
                return ElevatedButton(
                  onPressed: data
                      ? () {
                          if (_bloc.state.isValidate) {
                            context.router.pop(_bloc.state.params);
                          }
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: context.colors.secondary,
                      disabledBackgroundColor: context.colors.border,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    context.tr(LocaleKeys.OrderLine_Registration),
                    style:
                        context.typographies.bodyBold.withColor(Colors.white),
                  ),
                );
              },
              selector: (state) => state.isValidate,
            ),
          )
        ],
      ),
    );
  }
}
