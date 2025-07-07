import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iqra_wa_irtaqi/features/centers/models/center.dart';

part 'centers_state.freezed.dart';

@freezed
abstract class CentersState with _$CentersState {
  const factory CentersState({
    @Default(<Center>[]) List<Center> centers,
    DocumentSnapshot<Map<String, dynamic>>? lastDoc,
    @Default(false) bool hasReachedMax,
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default(false) bool isSelecting,
    @Default(<String>{}) Set<String> selectedIds,
    @Default('') String query,
  }) = _CentersState;
}
