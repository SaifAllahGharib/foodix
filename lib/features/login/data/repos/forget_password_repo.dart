import 'package:failure_handler/failure_handler.dart';

import '../../../../core/shared/models/response.dart';
import '../../../../core/utils/result.dart';

abstract class ForgetPasswordRepository {
  Future<Result<AppFailure, ResponseModel>> forgetPassword(String email);
}
