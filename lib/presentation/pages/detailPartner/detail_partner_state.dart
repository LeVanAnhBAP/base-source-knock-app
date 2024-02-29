import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'detail_partner_state.freezed.dart';

enum DetailPartnerStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class DetailPartnerState with _$DetailPartnerState {
  const factory DetailPartnerState({
    @Default(DetailPartnerStatus.initial) DetailPartnerStatus status,
    BaseException? error,
    Map<String,dynamic>? userInfo,
  }) = _DetailPartnerState;
}
