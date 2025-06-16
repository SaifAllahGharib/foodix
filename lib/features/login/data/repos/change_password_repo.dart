import 'package:dartz/dartz.dart';
import 'package:foodix/core/errors/failure.dart';
import 'package:foodix/features/login/data/models/change_password_model.dart';

import '../../../../core/shared/models/response.dart';

abstract class ChangePasswordRepository {
  Future<Either<Failure, ResponseModel>> changePassword(
    ChangePasswordModel changePassword,
  );
}
