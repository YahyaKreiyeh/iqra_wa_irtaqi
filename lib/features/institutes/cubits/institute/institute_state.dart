import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/features/centers/models/center.dart';
import 'package:iqra_wa_irtaqi/features/teachers/models/teacher.dart';

part 'institute_state.freezed.dart';

@freezed
abstract class InstituteState with _$InstituteState {
  factory InstituteState({
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
    String? initialManagerId,
    String? managerId,
    @Default(Result<List<Teacher>>.empty())
    Result<List<Teacher>> managersResult,
    String? initialCenterId,
    String? centerId,
    @Default(Result<List<Center>>.empty()) Result<List<Center>> centersResult,
    @Default(Result.empty()) Result status,
  }) = _InstituteState;
}
