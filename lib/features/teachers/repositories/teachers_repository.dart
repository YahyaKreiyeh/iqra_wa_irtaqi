import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/features/teachers/models/teacher.dart';

class TeachersRepository {
  final CollectionReference<Map<String, dynamic>> _col = FirebaseFirestore
      .instance
      .collection('teachers');

  Future<QuerySnapshot<Map<String, dynamic>>> findMatching({
    required String firstName,
    required String lastName,
    required String motherName,
    required String fatherName,
    required DateTime birthDate,
  }) {
    return _col
        .where('firstName', isEqualTo: firstName)
        .where('lastName', isEqualTo: lastName)
        .where('motherName', isEqualTo: motherName)
        .where('fatherName', isEqualTo: fatherName)
        .where('birthDate', isEqualTo: birthDate.toIso8601String())
        .get();
  }

  Future<Result<String>> createTeacher(Teacher t) async {
    try {
      final docRef = _col.doc();
      await docRef.set(t.toJson());
      return Result.success(data: docRef.id);
    } catch (e) {
      return Result.failure(
        error: Exception(e.toString()),
        data: null,
        errorMessage: e.toString(),
      );
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchTeachers({
    DocumentSnapshot<Map<String, dynamic>>? startAfter,
    int limit = 10,
  }) {
    var query = _col.orderBy('lastName').orderBy('firstName').limit(limit);
    if (startAfter != null) {
      query = query.startAfterDocument(startAfter);
    }
    return query.get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> searchTeachers({
    required String q,
    DocumentSnapshot<Map<String, dynamic>>? startAfter,
    int limit = 10,
  }) {
    final end = '$q';
    var query = _col.orderBy('lastName').startAt([q]).endAt([end]).limit(limit);
    if (startAfter != null) {
      query = query.startAfterDocument(startAfter);
    }
    return query.get();
  }

  Future<Result<void>> updateTeacher(String id, Teacher t) async {
    try {
      await _col.doc(id).update(t.toJson());
      return const Result.success(data: null);
    } catch (e) {
      return Result.failure(
        error: Exception(e.toString()),
        data: null,
        errorMessage: e.toString(),
      );
    }
  }

  Future<Result<void>> deleteTeacher(String id) async {
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
