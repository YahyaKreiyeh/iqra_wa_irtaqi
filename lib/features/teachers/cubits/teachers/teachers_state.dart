import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iqra_wa_irtaqi/features/teachers/models/teacher.dart';

part 'teachers_state.freezed.dart';

@freezed
abstract class TeachersState with _$TeachersState {
  const factory TeachersState({
    @Default(<Teacher>[]) List<Teacher> teachers,
    DocumentSnapshot<Map<String, dynamic>>? lastDoc,
    @Default(false) bool hasReachedMax,
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default(false) bool isSelecting,
    @Default(<String>{}) Set<String> selectedIds,
    @Default('') String query,
  }) = _TeachersState;
}
