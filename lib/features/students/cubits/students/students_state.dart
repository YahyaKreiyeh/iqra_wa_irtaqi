import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iqra_wa_irtaqi/features/students/models/student.dart';

part 'students_state.freezed.dart';

@freezed
abstract class StudentsState with _$StudentsState {
  const factory StudentsState({
    @Default(<Student>[]) List<Student> students,
    DocumentSnapshot<Map<String, dynamic>>? lastDoc,
    @Default(false) bool hasReachedMax,
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default(false) bool isSelecting,
    @Default(<String>{}) Set<String> selectedIds,
    @Default('') String query,
  }) = _StudentsState;
}
