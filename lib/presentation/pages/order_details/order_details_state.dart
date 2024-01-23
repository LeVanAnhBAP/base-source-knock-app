import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'order_details_state.freezed.dart';

enum OrderDetailsStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class OrderDetailsState with _$OrderDetailsState {
  const factory OrderDetailsState({
    @Default(OrderDetailsStatus.initial) OrderDetailsStatus status,
    BaseException? error,
  }) = _OrderDetailsState;
}
