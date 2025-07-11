import 'package:freezed_annotation/freezed_annotation.dart';

part 'institute.freezed.dart';
part 'institute.g.dart';

@freezed
abstract class Institute with _$Institute {
  const factory Institute({
    required String id,
    required String name,
    required String location,
    String? notes,
    String? managerId,
    String? centerId,
  }) = _Institute;

  factory Institute.fromJson(Map<String, dynamic> json) =>
      _$InstituteFromJson(json);
}
