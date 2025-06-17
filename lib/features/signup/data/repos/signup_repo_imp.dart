import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodix/core/errors/failure.dart';
import 'package:foodix/core/services/auth_services.dart';
import 'package:foodix/core/services/db_services.dart';
import 'package:foodix/features/signup/data/models/signup_model.dart';
import 'package:foodix/features/signup/data/repos/signup_repo.dart';

import '../../../../core/shared/models/user_model.dart';

class SignupRepositoryImp extends SignupRepository {
  final AuthServices _authService;
  final DBServices _dbServices;

  SignupRepositoryImp(this._authService, this._dbServices);

  @override
  Future<Either<Failure, String>> signup(
    SignupModel user,
    String successMsg,
    String fieldMsg,
  ) async {
    try {
      final response = await _authService.signUp(user);

      if (response.user != null) {
        String uid = response.user!.uid;
        UserModel userModel = UserModel(
          uid: uid,
          name: user.name,
          email: user.email,
          phone: user.phone,
          role: user.role,
        );

        return _saveUserToDB(userModel, successMsg);
      } else {
        return right(fieldMsg);
      }
    } on FirebaseAuthException catch (e) {
      return left(FirebaseAuthFailure(e.code));
    } catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }

  Future<Either<Failure, String>> _saveUserToDB(
    UserModel user,
    String successMsg,
  ) async {
    try {
      await _dbServices.setUser(user);
      return right(successMsg);
    } catch (e) {
      return left(FirebaseDBFailure(e.toString()));
    }
  }
}
