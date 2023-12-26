
import 'package:freezed_annotation/freezed_annotation.dart';
part 'reset_pass_params.freezed.dart';

@freezed
class ResetPassParams with _$ResetPassParams{
  const factory ResetPassParams({
    required String email,
    @Default('user')
    String type
  }) = _ResetPassParams;
}