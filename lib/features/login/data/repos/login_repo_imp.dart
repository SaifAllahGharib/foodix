import 'package:failure_handler/failure_handler.dart';

import '../../../../core/services/auth_services.dart';
import '../../../../core/utils/result.dart';
import '../models/login_model.dart';
import 'login_repo.dart';

class LoginRepositoryImp implements LoginRepository {
  final AuthServices _authServices;

  LoginRepositoryImp(this._authServices);

  @override
  Future<Result<AppFailure, String>> login(
    LoginModel user,
    String successMsg,
    String fieldMsg,
  ) async {
    try {
      final response = await _authServices.login(user);

      if (response.user != null) {
        return Success(successMsg);
      } else {
        return Success(fieldMsg);
      }
    } catch (e) {
      return Failure(ErrorHandler.handle(e));
    }
  }
}
