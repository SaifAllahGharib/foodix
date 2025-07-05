import 'package:failure_handler/failure_handler.dart';
import 'package:foodix/features/verification/data/repos/verificarion_repo.dart';

import '../../../../core/services/auth_services.dart';
import '../../../../core/utils/result.dart';

class VerificationRepositoryImp extends VerificationRepository {
  final AuthServices _authServices;

  VerificationRepositoryImp(this._authServices);

  @override
  Future<Result<AppFailure, void>> sendEmailVerification() async {
    try {
      return Success(await _authServices.sendEmailVerification());
    } catch (e) {
      return Failure(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Result<AppFailure, bool>> isEmailVerified() async {
    try {
      return Success(await _authServices.isEmailVerified());
    } catch (e) {
      return Failure(ErrorHandler.handle(e));
    }
  }
}
