import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/features/mosques/models/mosque.dart';

class MosquesRepository {
  final CollectionReference<Map<String, dynamic>> _col = FirebaseFirestore
      .instance
      .collection('mosques');

  Future<Result<String>> createMosque(Mosque mosque) async {
    try {
      final docRef = _col.doc();
      await docRef.set(mosque.toJson());
      return Result.success(data: docRef.id);
    } catch (e) {
      return Result.failure(
        error: Exception(e.toString()),
        data: null,
        errorMessage: e.toString(),
      );
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchMosques({
    DocumentSnapshot<Map<String, dynamic>>? startAfter,
    int limit = 10,
  }) {
    var query = _col.orderBy('name').limit(limit);
    if (startAfter != null) {
      query = query.startAfterDocument(startAfter);
    }
    return query.get();
  }

  Future<Result<void>> updateMosque(String id, Mosque mosque) async {
    try {
      await _col.doc(id).update(mosque.toJson());
      return const Result.success(data: null);
    } catch (e) {
      return Result.failure(
        error: Exception(e.toString()),
        data: null,
        errorMessage: e.toString(),
      );
    }
  }

  Future<Result<void>> deleteMosque(String id) async {
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
}
