import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/features/institutes/models/institute.dart';

class InstitutesRepository {
  final CollectionReference<Map<String, dynamic>> _col = FirebaseFirestore
      .instance
      .collection('institutes');

  Future<Result<String>> createInstitute(Institute institute) async {
    try {
      final docRef = _col.doc();
      await docRef.set(institute.toJson());
      return Result.success(data: docRef.id);
    } catch (e) {
      return Result.failure(
        error: Exception(e.toString()),
        data: null,
        errorMessage: e.toString(),
      );
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchInstitutes({
    DocumentSnapshot<Map<String, dynamic>>? startAfter,
    int limit = 10,
    String? centerId,
  }) {
    var query = _col.orderBy('name');
    if (centerId != null) {
      query = query.where('centerId', isEqualTo: centerId);
    }
    query = query.limit(limit);
    if (startAfter != null) query = query.startAfterDocument(startAfter);
    return query.get();
  }

  Future<Result<void>> updateInstitute(String id, Institute institute) async {
    try {
      await _col.doc(id).update(institute.toJson());
      return const Result.success(data: null);
    } catch (e) {
      return Result.failure(
        error: Exception(e.toString()),
        data: null,
        errorMessage: e.toString(),
      );
    }
  }

  Future<Result<void>> deleteInstitute(String id) async {
    try {
      await _col.doc(id).delete();
      return const Result.success(data: null);
    } catch (e) {
      return Result.failure(
        error: Exception(e.toString()),
        data: null,
        errorMessage: e.toString(),
      );
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> searchInstitutes({
    required String q,
    DocumentSnapshot<Map<String, dynamic>>? startAfter,
    int limit = 10,
    String? centerId,
  }) {
    final end = '$q\uf8ff';
    var query = _col.orderBy('name').startAt([q]).endAt([end]);
    if (centerId != null) {
      query = query.where('centerId', isEqualTo: centerId);
    }
    query = query.limit(limit);
    if (startAfter != null) query = query.startAfterDocument(startAfter);
    return query.get();
  }

  Future<void> clearCenterReferences(String centerId) async {
    final snap = await _col.where('centerId', isEqualTo: centerId).get();
    for (var doc in snap.docs) {
      await _col.doc(doc.id).update({'centerId': null});
    }
  }

  Future<void> clearManagerReferences(String managerId) async {
    final snap = await _col.where('managerId', isEqualTo: managerId).get();
    for (var doc in snap.docs) {
      await _col.doc(doc.id).update({'managerId': null});
    }
  }
}
