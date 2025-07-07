import 'package:freezed_annotation/freezed_annotation.dart';

part 'center.freezed.dart';
part 'center.g.dart';

@freezed
abstract class Center with _$Center {
  const factory Center({
    required String id,
    required String name,
    required String location,
    String? notes,
  }) = _Center;

  factory Center.fromJson(Map<String, dynamic> json) => _$CenterFromJson(json);
}
