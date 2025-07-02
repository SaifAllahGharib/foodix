import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:foodix/core/services/auth_services.dart';
import 'package:foodix/features/login/data/models/login_model.dart';
import 'package:foodix/features/login/data/repos/login_repo.dart';

class LoginRepositoryImp implements LoginRepository {
  final AuthServices _authServices;

  LoginRepositoryImp(this._authServices);

  @override
  Future<Either<Failure, String>> login(
    LoginModel user,
    String successMsg,
    String fieldMsg,
  ) async {
    try {
      final response = await _authServices.login(user);

      if (response.user != null) {
        return right(successMsg);
      } else {
        return right(fieldMsg);
      }
    } on FirebaseAuthException catch (e) {
      return left(FirebaseAuthFailure(e.code));
    } catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }
}
