import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iqra_wa_irtaqi/core/constants/constants.dart';
import 'package:iqra_wa_irtaqi/core/localization/locale_keys.g.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/features/authentication/models/authentication_dto.dart';

class AuthenticationRepository {
  final FirebaseAuth _firebaseAuth;
  AuthenticationRepository({FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<Result<UserCredential>> register(AuthenticationDTO dto) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: dto.email,
        password: dto.password,
      );

      return Result.success(data: credential);
    } on FirebaseAuthException catch (e) {
      final key = errorKeyMap[e.code] ?? LocaleKeys.firebase_generic_error;
      final msg = key.tr();
      return Result.failure(
        error: Exception(e.code),
        data: null,
        errorMessage: msg,
      );
    } catch (e) {
      return Result.failure(
        error: Exception(e.toString()),
        data: null,
        errorMessage: e.toString(),
      );
    }
  }

  Future<Result<UserCredential>> login(AuthenticationDTO dto) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: dto.email,
        password: dto.password,
      );
      return Result.success(data: credential);
    } on FirebaseAuthException catch (e) {
      final key = errorKeyMap[e.code] ?? LocaleKeys.firebase_generic_error;
      final msg = key.tr();
      return Result.failure(
        error: Exception(e.code),
        data: null,
        errorMessage: msg,
      );
    } catch (e) {
      return Result.failure(
        error: Exception(e.toString()),
        data: null,
        errorMessage: e.toString(),
      );
    }
  }

  Future<Result<void>> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return const Result.success(data: null);
    } on FirebaseAuthException catch (e) {
      final key = errorKeyMap[e.code] ?? LocaleKeys.firebase_generic_error;
      final msg = key.tr();
      return Result.failure(
        error: Exception(e.code),
        data: null,
        errorMessage: msg,
      );
    } catch (e) {
      return Result.failure(
        error: Exception(e.toString()),
        data: null,
        errorMessage: e.toString(),
      );
    }
  }
}
