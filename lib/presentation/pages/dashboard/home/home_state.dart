import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'home_state.freezed.dart';

enum HomeStatus {
  initial,
  loading,
  success,
  failure,
  refreshing,
}
@JsonSerializable()
@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeStatus.initial) HomeStatus status,
    BaseException? error,
    List<dynamic>? listData,
    int? totalPage
  }) = _HomeState;


}
