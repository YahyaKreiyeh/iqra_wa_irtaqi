import 'package:freezed_annotation/freezed_annotation.dart';

part 'mosque.freezed.dart';
part 'mosque.g.dart';

@freezed
abstract class Mosque with _$Mosque {
  const factory Mosque({
    required String name,
    required String location,
    String? notes,
  }) = _Mosque;

  factory Mosque.fromJson(Map<String, dynamic> json) => _$MosqueFromJson(json);
}
