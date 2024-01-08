import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginate_response.freezed.dart';
part 'paginate_response.g.dart';

@Freezed(genericArgumentFactories: true)
class PaginateResponse<T> with _$PaginateResponse<T> {
  const factory PaginateResponse({
    @JsonKey(name: 'data') required T data,
    @JsonKey(name: 'total') required int total,
    @JsonKey(name: 'per_page') required int perPage,
  }) = _PaginateResponse;

  factory PaginateResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$PaginateResponseFromJson(json, fromJsonT);
}
