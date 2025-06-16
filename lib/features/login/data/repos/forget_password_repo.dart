import 'package:dartz/dartz.dart';
import 'package:foodix/core/errors/failure.dart';

import '../../../../core/shared/models/response.dart';

abstract class ForgetPasswordRepository {
  Future<Either<Failure, ResponseModel>> forgetPassword(String email);
}
