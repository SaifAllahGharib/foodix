import 'package:failure_handler/failure_handler.dart';
import 'package:foodix/core/utils/result.dart';
import 'package:foodix/features/signup/data/repos/signup_repo.dart';

import '../../../../core/services/auth_services.dart';
import '../../../../core/services/db_services.dart';
import '../../../../core/shared/models/user_model.dart';
import '../models/signup_model.dart';

class SignupRepositoryImp extends SignupRepository {
  final AuthServices _authService;
  final DBServices _dbServices;

  SignupRepositoryImp(this._authService, this._dbServices);

  @override
  Future<Result<AppFailure, String>> signup(
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
        return Success(fieldMsg);
      }
    } catch (e) {
      return Failure(ErrorHandler.handle(e));
    }
  }

  Future<Result<AppFailure, String>> _saveUserToDB(
    UserModel user,
    String successMsg,
  ) async {
    try {
      await _dbServices.setUser(user);
      return Success(successMsg);
    } catch (e) {
      return Failure(ErrorHandler.handle(e));
    }
  }
}
