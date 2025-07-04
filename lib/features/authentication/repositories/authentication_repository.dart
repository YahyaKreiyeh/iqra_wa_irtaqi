import 'package:firebase_auth/firebase_auth.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/features/authentication/models/register_dto.dart';

class AuthenticationRepository {
  final FirebaseAuth _firebaseAuth;
  AuthenticationRepository({FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<Result<UserCredential>> register(RegisterDTO dto) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: dto.email,
        password: dto.password,
      );

      return Result.success(data: credential);
    } on FirebaseAuthException catch (e) {
      return Result.failure(
        error: Exception(e.message ?? e.code),
        data: null,
        errorMessage: e.message ?? e.code,
      );
    } catch (e) {
      return Result.failure(
        error: Exception(e.toString()),
        data: null,
        errorMessage: e.toString(),
      );
    }
  }

  Future<Result<UserCredential>> login(RegisterDTO dto) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: dto.email,
        password: dto.password,
      );
      return Result.success(data: credential);
    } on FirebaseAuthException catch (e) {
      return Result.failure(
        error: Exception(e.message ?? e.code),
        data: null,
        errorMessage: e.message ?? e.code,
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
