import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/features/centers/models/center.dart';

class CentersRepository {
  final _col = FirebaseFirestore.instance.collection('centers');

  Future<Result<String>> createCenter(Center c) async {
    try {
      final doc = _col.doc();
      await doc.set(c.toJson());
      return Result.success(data: doc.id);
    } catch (e) {
      return Result.failure(
        error: Exception(e.toString()),
        data: null,
        errorMessage: e.toString(),
      );
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchCenters({
    DocumentSnapshot? startAfter,
    int limit = 10,
  }) {
    var q = _col.orderBy('name').limit(limit);
    if (startAfter != null) q = q.startAfterDocument(startAfter);
    return q.get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> searchCenters({
    required String q,
    DocumentSnapshot? startAfter,
    int limit = 10,
  }) {
    final end = '\$q\uf8ff';
    var query = _col.orderBy('name').startAt([q]).endAt([end]).limit(limit);
    if (startAfter != null) query = query.startAfterDocument(startAfter);
    return query.get();
  }

  Future<Result<void>> updateCenter(String id, Center c) async {
    try {
      await _col.doc(id).update(c.toJson());
      return const Result.success(data: null);
    } catch (e) {
      return Result.failure(
        error: Exception(e.toString()),
        data: null,
        errorMessage: e.toString(),
      );
    }
  }

  Future<Result<void>> deleteCenter(String id) async {
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

  Future<void> clearManagerReferences(String managerId) async {
    final snap = await _col.where('managerId', isEqualTo: managerId).get();
    for (var doc in snap.docs) {
      await _col.doc(doc.id).update({'managerId': null});
    }
  }
}
