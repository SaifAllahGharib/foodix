import 'package:failure_handler/failure_handler.dart';

import '../../../../core/shared/models/response.dart';
import '../../../../core/utils/result.dart';
import '../models/change_password_model.dart';

abstract class ChangePasswordRepository {
  Future<Result<AppFailure, ResponseModel>> changePassword(
    ChangePasswordModel changePassword,
  );
}
