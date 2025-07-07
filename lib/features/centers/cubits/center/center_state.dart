import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';

part 'center_state.freezed.dart';

@freezed
abstract class CenterState with _$CenterState {
  factory CenterState({
    @Default('') String id,
    @Default(false) bool isEditing,
    @Default('') String initialName,
    @Default('') String initialLocation,
    @Default('') String initialNotes,
    @Default('') String name,
    String? nameErrorKey,
    @Default('') String location,
    String? locationErrorKey,
    @Default('') String notes,
    @Default(Result.empty()) Result status,
  }) = _CenterState;
}
