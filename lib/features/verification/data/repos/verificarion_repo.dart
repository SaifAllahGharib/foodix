import 'package:failure_handler/failure_handler.dart';

import '../../../../core/utils/result.dart';

abstract class VerificationRepository {
  Future<Result<AppFailure, void>> sendEmailVerification();

  Future<Result<AppFailure, bool>> isEmailVerified();
}
