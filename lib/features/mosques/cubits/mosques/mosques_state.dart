import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iqra_wa_irtaqi/features/mosques/models/mosque.dart';

part 'mosques_state.freezed.dart';

@freezed
abstract class MosquesState with _$MosquesState {
  const factory MosquesState({
    @Default(<Mosque>[]) List<Mosque> mosques,
    DocumentSnapshot<Map<String, dynamic>>? lastDoc,
    @Default(false) bool hasReachedMax,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _MosquesState;
}
