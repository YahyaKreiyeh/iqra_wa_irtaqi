import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iqra_wa_irtaqi/features/institutes/models/institute.dart';

part 'institutes_state.freezed.dart';

@freezed
abstract class InstitutesState with _$InstitutesState {
  const factory InstitutesState({
    @Default(<Institute>[]) List<Institute> institutes,
    DocumentSnapshot<Map<String, dynamic>>? lastDoc,
    @Default(false) bool hasReachedMax,
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default(false) bool isSelecting,
    @Default(<String>{}) Set<String> selectedIds,
    @Default('') String query,
  }) = _InstitutesState;
}
